
local files = {
    "lib/atlas",
    "lib/sounds",
	  "items/blinds",
    "items/globals",
    "items/jokers",
    "items/backs"
}

local crossmodfiles = {
   "finity",

}

for i, v in pairs(files) do
    assert(SMODS.load_file(v..".lua"))()
end

for i, v in pairs(crossmodfiles) do
 if next(SMODS.find_mod(v)) then
     assert(SMODS.load_file("crossmod/" .. v .. ".lua"))()
 end
end



-- jade mode
local jpaot_config = SMODS.current_mod.config
local jpaot_path = SMODS.current_mod.path

-- Image Assets
local jpaot_assets = { img = nil }
local function get_jpaot_image()
    if not jpaot_assets.img then
        local file_data = NFS.newFileData(jpaot_path .. "assets/jadebeak.png")
        if file_data then
            jpaot_assets.img = love.graphics.newImage(love.image.newImageData(file_data))
        end
    end
    return jpaot_assets.img
end

-- Sound Assets
local jade_sounds = { enable = nil, disable = nil }

local function play_jade_sound(type)
    local filename = (type == "enable") and "jademode_enable.ogg" or "jademode_disable.ogg"
    
 
    if not jade_sounds[type] then
        local file_data = NFS.newFileData(jpaot_path .. "assets/" .. filename)
        if file_data then
            local sound_data = love.sound.newSoundData(file_data)
            jade_sounds[type] = love.audio.newSource(sound_data, "static")
        else
            print("JADE ERROR: Could not find sound: assets/" .. filename)
            return
        end
    end
    
    -- Play the sound
    if jade_sounds[type] then
        jade_sounds[type]:stop() -- Stop if currently playing to prevent overlap
        jade_sounds[type]:setVolume(0.5) -- Adjust volume if needed
        jade_sounds[type]:play()
    end
end


local function easeOutBounce(t, b, c, d)
    t = t / d
    if t < (1 / 2.75) then
        return c * (7.5625 * t * t) + b
    elseif t < (2 / 2.75) then
        t = t - (1.5 / 2.75)
        return c * (7.5625 * t * t + 0.75) + b
    elseif t < (2.5 / 2.75) then
        t = t - (2.25 / 2.75)
        return c * (7.5625 * t * t + 0.9375) + b
    else
        t = t - (2.625 / 2.75)
        return c * (7.5625 * t * t + 0.984375) + b
    end
end

local function easeInElastic(t, b, c, d)
    if t == 0 then return b end
    t = t / d
    if t == 1 then return b + c end
    local p = d * 0.3
    local a = c
    local s = p / 4
    t = t - 1
    return -(a * math.pow(2, 10 * t) * math.sin((t * d - s) * (2 * math.pi) / p)) + b
end


local jade_mode = {
    timer = 1,
    duration = 1.3,

    
    active = jpaot_config.jpaot_beak or false, 
    current_scale_y = 0,
    last_time = love.timer.getTime()
}


local ref_love_draw = love.draw

function love.draw()
    ref_love_draw()

   
    local target = jpaot_config.jpaot_beak or false
    
   
    local current_time = love.timer.getTime()
    local dt = current_time - (jade_mode.last_time or current_time)
    jade_mode.last_time = current_time

    
    if target ~= jade_mode.active then
        
        -- Apply the new state
        jade_mode.active = target
        jade_mode.timer = 0 
        
        -- LOGIC: Sound & Duration Setup
        if jade_mode.active then
            -- ENABLING
            jade_mode.duration = 3 -- 2 Seconds to open
            play_jade_sound("enable")
        else
            -- DISABLING
            jade_mode.duration = 1.0 -- 1 Second to close
            play_jade_sound("disable")
        end
    end


    if jade_mode.timer < jade_mode.duration then
        jade_mode.timer = math.min(jade_mode.timer + dt, jade_mode.duration)
    end

    if jade_mode.timer >= jade_mode.duration then
        jade_mode.current_scale_y = jade_mode.active and 1 or 0
    else
        if jade_mode.active then
            -- Opening Animation
            jade_mode.current_scale_y = easeInElastic(jade_mode.timer, 0, 1, jade_mode.duration)
        else
            -- Closing Animation
            jade_mode.current_scale_y = easeOutBounce(jade_mode.timer, 1, -1, jade_mode.duration)
        end
    end

    -- 5. RENDER
    local img = get_jpaot_image()
    
    if img and jade_mode.current_scale_y > 0.01 then
        love.graphics.setColor(1, 1, 1, 1)
        
        local screen_w = love.graphics.getWidth()
        local screen_h = love.graphics.getHeight()
        local img_w, img_h = img:getDimensions()
        
        local target_height = screen_h * 0.5 
        local base_scale = target_height / img_h
        
        local final_scale_x = base_scale * 0.75
        local final_scale_y = base_scale * 0.75 * jade_mode.current_scale_y
        
        local draw_x = (screen_w / 2 ) 
        local draw_y = screen_h 
        
        love.graphics.draw(
            img, 
            draw_x, 
            draw_y,     
            0,                               
            final_scale_x, final_scale_y,                
            img_w / 2, img_h 
        )
    end
end

SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { align = "cm", padding = 0.1, colour = G.C.BLACK, r=0.1, emboss = 0.05 },
        nodes = {
            {
                n = G.UIT.R, config = { align = "cm", padding = 0 },
                nodes = {
                    { 
                        n = G.UIT.C, config = { align = "cm", padding = 0.1},
                        nodes = {
                            create_toggle{
                                label = "JADE MODE",
                                active_colour = G.C.GREEN,
                                ref_table = jpaot_config,
                                ref_value = "jpaot_beak"
                            }
                        }
                    }
                }
            }
        }
    }
end