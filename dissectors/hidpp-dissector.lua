-- Symbols
local IF_CLASS_UNKNOWN          = 0xFFFF
local HID                       = 0x0003

--      Definitions
-- Report
local REPORT_SHORT              = 0x10
local REPORT_LONG               = 0x11
local REPORT_VERY_LONG          = 0x12
local REPORT_UNK1               = 0x20
local REPORT_SHORT_LEN          = 7
local REPORT_LONG_LEN           = 20
local REPORT_VERY_LONG_LEN      = 64
local REPORT_UNK1_LEN           = 15

--  Errors

-- hid++ 1.0
local HIDPP1_ERR_SUCCESS                = 0x00
local HIDPP1_ERR_INVALID_SUBID          = 0x01
local HIDPP1_ERR_INVALID_ADDRESS        = 0x02
local HIDPP1_ERR_INVALID_VALUE          = 0x03
local HIDPP1_ERR_CONNECT_FAIL           = 0x04
local HIDPP1_ERR_TOO_MANY_DEVICES       = 0x05
local HIDPP1_ERR_ALREADY_EXISTS         = 0x06
local HIDPP1_ERR_BUSY                   = 0x07
local HIDPP1_ERR_UNKNOWN_DEVICE         = 0x08
local HIDPP1_ERR_RESOURCE_ERROR         = 0x09
local HIDPP1_ERR_REQUEST_UNAVAILABLE    = 0x0a
local HIDPP1_ERR_INVALID_PARAM_VALUE    = 0x0b
local HIDPP1_ERR_WRONG_PIN_CODE         = 0x0c

-- hid++ 2.0
local HIDPP2_ERR_NONE                   = 0
local HIDPP2_ERR_UNKNOWN                = 1
local HIDPP2_ERR_INVALID_ARGUMENT       = 2
local HIDPP2_ERR_OUT_OF_RANGE           = 3
local HIDPP2_ERR_HW_ERROR               = 4
local HIDPP2_ERR_LOGITTECH_INTERNAL     = 5
local HIDPP2_ERR_INVALID_FEATURE_INDEX  = 6
local HIDPP2_ERR_INVALID_FUNCTION_ID    = 7
local HIDPP2_ERR_BUSY                   = 8
local HIDPP2_ERR_UNSUPORTED             = 9
local HIDPP2_ERR_HIDPP1                 = 0x8F -- compatibility, HID++ 1.0's ERROR_MSG

-- Features (functions)
local FT_I_ROOT                     = 0x0000
local FT_I_FEATURE_SET              = 0x0001
local FT_I_FEATURE_INFO             = 0x0002 -- TODO
local FT_I_FIRMWARE_INFO            = 0x0003
local FT_GET_DEVICE_NAME_TYPE       = 0x0005 -- TODO
local FT_DEVICE_GROUPS              = 0x0006 -- TODO
local FT_RESET                      = 0x0020 -- TODO
local FT_DEVICE_DISCONNECTION       = 0x0040
local FT_DEVICE_CONNECTION          = 0x0041
local FT_UNIFYING_LOCK_CHANGE_INFO  = 0x004A
local FT_SET_REGISTER               = 0x0080
local FT_GET_REGISTER               = 0x0081
local FT_SET_LONG_REGISTER          = 0x0082
local FT_GET_LONG_REGISTER          = 0x0083
local FT_DFU_CONTROL                = 0x00C0 -- TODO
local FT_DFU_CONTROL_2              = 0x00C1 -- TODO
local FT_DFU                        = 0x00D0 -- TODO
local FT_BATTERY_LEVEL_SATUS        = 0x1000 -- TODO
local FT_LED_SW_CONTROL             = 0x1300 -- TODO
local FT_CHANGE_HOST                = 0x1814 -- TODO
local FT_BACKLIGHT                  = 0x1981 -- TODO
local FT_KBD_REPROG_KEYS            = 0x1B00 -- TODO
local FT_KBD_REPROG_KEYS_V2         = 0x1B01 -- TODO, Temporary name
local FT_KBD_REPROG_KEYS_V2_2       = 0x1B02 -- TODO, Temporary name
local FT_KBD_REPROG_KEYS_V3         = 0x1B03 -- TODO, Temporary name
local FT_SPECIAL_KEYS_BUTTONS       = 0x1B04 -- TODO
local FT_WIRELESS_DEVICE_SATUS      = 0x1D4B -- TODO
local FT_LEFT_RIGHT_SWAP            = 0x2001 -- TODO
local FT_SWAP_BUTTON                = 0x2005 -- TODO
local FT_VERTICAL_SCROLLING         = 0x2100 -- TODO
local FT_SMART_SHIFT                = 0x2110 -- TODO
local FT_HIRES_SCROLLING            = 0x2120 -- TODO
local FT_HIRES_WHEEL                = 0x2121 -- TODO
local FT_LOWRES_WHEEL               = 0x2130 -- TODO
local FT_MOUSE_POINTER_BASIC        = 0x2200 -- TODO
local FT_AJUSTABLE_DPI              = 0x2201 -- TODO
local FT_POINTER_SPEED              = 0x2205 -- TODO
local FT_ANGLE_SNAPPING             = 0x2230 -- TODO
local FT_SURFACE_TUNNING            = 0x2240 -- TODO
local FT_HYBRID_TRACKING            = 0x2400 -- TODO
local FT_FN_SWAP                    = 0x40A0 -- TODO
local FT_NEW_FN_SWAP                = 0x40A2 -- TODO
local FT_K375S_FN_SWAP              = 0x40A3 -- TODO
local FT_ENCRYPTION                 = 0x4100 -- TODO
local FT_LOCAL_KEY_STATE            = 0x4220 -- TODO
local FT_SOLAR_KEYBOARD             = 0x4301 -- TODO
local FT_KEYBOARD_LAYOUT            = 0x4520 -- TODO
local FT_KEYBOARD_DISABLE           = 0x4521 -- TODO
local FT_DUALPLATFORM               = 0x4530 -- TODO
local FT_KEYBOARD_LAYOUT_2          = 0x4540 -- TODO, Temporary name
local FT_TOUCHPAD_FW_ITEMS          = 0x6010 -- TODO
local FT_TOUCHPAD_SW_ITEMS          = 0x6011 -- TODO
local FT_TOUCHPAD_WIN8_FW_ITEMS     = 0x6012 -- TODO
local FT_TOUCHPAD_RAW_XY            = 0x6100 -- TODO
local FT_TOUCHMOUSE_RAW_POINTS      = 0x6110 -- TODO
local FT_TOUCHMOUSE_6120            = 0x6120 -- TODO, Temporary name
local FT_GESTURE                    = 0x6500 -- TODO
local FT_GESTURE_2                  = 0x6501 -- TODO, Temporary name
local FT_GKEYS                      = 0x8010 -- TODO
local FT_MKEYS                      = 0x8020 -- TODO
local FT_MR                         = 0x8030 -- TODO
local FT_AJUSTABLE_REPORT_RATE      = 0x8060 -- TODO
local FT_COLOR_LED_EFFECTS          = 0x8070 -- TODO
local FT_ONBOARD_PROFILES           = 0x8100 -- TODO
local FT_MOUSE_BUTTON_SPY           = 0x8110 -- TODO
local FT_FORCE_FEEDBACK             = 0x8123 -- TODO

local REG_UNIFYING_NOTIFICATIONS    = 0x00
local REG_UNIFYING_CONNECTION_STATE = 0x02
local REG_UNIFYING_DEV_CONNECTION   = 0xB2
local REG_UNIFYING_DEV_ACTIVITY     = 0xB3

-- Protocol
local hidpp_proto = Proto("hidpp", "Logitech HID++")

-- Fields
local f_raw     = ProtoField.bytes  ("hidpp.raw",       "Raw Data")
local f_report  = ProtoField.uint8  ("hidpp.report",    "Report Type",  base.HEX, {
    [REPORT_SHORT]      = "Short",
    [REPORT_LONG]       = "Long",
    [REPORT_VERY_LONG]  = "Very Long",
    [REPORT_UNK1]       = "Unknown"
})
local device_arr = {
    [0x00]  = "Wired mouse",
    [0xFF]  = "Unconnected wireless adapter",
}
for i = 1, 0xFF - 1 do
    device_arr[i] = "Device " .. i
end
local f_device  = ProtoField.uint8  ("hidpp.device",    "Device",       base.HEX, device_arr)
local f_feature = ProtoField.uint8  ("hidpp.feature",   "Feature",      base.HEX, {
    [FT_I_ROOT]                     = "IRoot",
    [FT_I_FEATURE_SET]              = "IFeatureSet",
    [FT_I_FEATURE_INFO]             = "IFeatureInfo",
    [FT_I_FIRMWARE_INFO]            = "IFirmwareInfo",
    [FT_GET_DEVICE_NAME_TYPE]       = "GetDeviceNameType",
    [FT_DEVICE_GROUPS]              = "DeviceGroups",
    [FT_RESET]                      = "Reset",
    [FT_DEVICE_DISCONNECTION]       = "Device Disconnection",
    [FT_DEVICE_CONNECTION]          = "Device Connection",
    [FT_UNIFYING_LOCK_CHANGE_INFO]  = "Unifying Receiver Locking Change Information",
    [FT_SET_REGISTER]               = "SetRegister",
    [FT_GET_REGISTER]               = "GetRegister",
    [FT_SET_LONG_REGISTER]          = "SetLongRegister",
    [FT_GET_LONG_REGISTER]          = "GetLongRegister",
    [FT_DFU_CONTROL]                = "DFU Control",
    [FT_DFU_CONTROL_2]              = "DFU Control 2",
    [FT_DFU]                        = "DFU",
    [FT_BATTERY_LEVEL_SATUS]        = "BatteryLevelStatus",
    [FT_LED_SW_CONTROL]             = "LedSoftwareControl",
    [FT_CHANGE_HOST]                = "ChangeHost",
    [FT_BACKLIGHT]                  = "Backlight",
    [FT_KBD_REPROG_KEYS]            = "KeyboardReprogrammableKeys",
    [FT_KBD_REPROG_KEYS_V2]         = "KeyboardReprogrammableKeys (v2)",
    [FT_KBD_REPROG_KEYS_V2_2]       = "KeyboardReprogrammableKeys (v2.2)",
    [FT_KBD_REPROG_KEYS_V3]         = "KeyboardReprogrammableKeys (v3)",
    [FT_SPECIAL_KEYS_BUTTONS]       = "SpecialKeysButtons",
    [FT_WIRELESS_DEVICE_SATUS]      = "WirelessDeviceStatus",
    [FT_LEFT_RIGHT_SWAP]            = "LeftRightSwap",
    [FT_SWAP_BUTTON]                = "SwapButton",
    [FT_VERTICAL_SCROLLING]         = "VerticalScrolling",
    [FT_SMART_SHIFT]                = "SmartShift",
    [FT_HIRES_SCROLLING]            = "HiResScrolling",
    [FT_HIRES_WHEEL]                = "HiResWheel",
    [FT_LOWRES_WHEEL]               = "LowResWheel",
    [FT_MOUSE_POINTER_BASIC]        = "MousePointerBasic",
    [FT_AJUSTABLE_DPI]              = "AjustableDpi",
    [FT_POINTER_SPEED]              = "PointerSpeed",
    [FT_ANGLE_SNAPPING]             = "AngleSnapping",
    [FT_SURFACE_TUNNING]            = "SurfaceTunning",
    [FT_HYBRID_TRACKING]            = "HybridTracking",
    [FT_FN_SWAP]                    = "FN Swap",
    [FT_NEW_FN_SWAP]                = "FN Swap (new)",
    [FT_K375S_FN_SWAP]              = "FN Swap (K375S)",
    [FT_ENCRYPTION]                 = "Encryption",
    [FT_LOCAL_KEY_STATE]            = "LocalKeyState",
    [FT_SOLAR_KEYBOARD]             = "SolarKeyboard",
    [FT_KEYBOARD_LAYOUT]            = "KeyboardLayout",
    [FT_KEYBOARD_DISABLE]           = "KeyboardDisable",
    [FT_DUALPLATFORM]               = "DualPlatform",
    [FT_KEYBOARD_LAYOUT_2]          = "KeyboardLayout2",
    [FT_TOUCHPAD_FW_ITEMS]          = "TouchpadFWItems",
    [FT_TOUCHPAD_SW_ITEMS]          = "TouchpadSWItems",
    [FT_TOUCHPAD_WIN8_FW_ITEMS]     = "TouchpadWin8FWItems",
    [FT_TOUCHPAD_RAW_XY]            = "TouchpadRawXY",
    [FT_TOUCHMOUSE_RAW_POINTS]      = "TouchmouseRawPoints",
    [FT_TOUCHMOUSE_6120]            = "Touchmouse6120",
    [FT_GESTURE]                    = "Gesture",
    [FT_GESTURE_2]                  = "Gesture2",
    [FT_GKEYS]                      = "GKeys",
    [FT_MKEYS]                      = "MKeys",
    [FT_MR]                         = "MR",
    [FT_AJUSTABLE_REPORT_RATE]      = "AjustableReportRate",
    [FT_COLOR_LED_EFFECTS]          = "ColorLedEffects",
    [FT_ONBOARD_PROFILES]           = "OnboardProfiles",
    [FT_MOUSE_BUTTON_SPY]           = "MouseButtonSpy",
    [FT_FORCE_FEEDBACK]             = "ForceFeedback",
})
local f_fctn    = ProtoField.string ("hidpp.fctn",      "Function")
local f_ase     = ProtoField.uint8  ("hidpp.ase",       "Application-specific event")
local f_sw_id   = ProtoField.uint8  ("hidpp.sw_id",     "Software ID",  base.HEX)
local f_args    = ProtoField.bytes  ("hidpp.args",      "Arguments")
local f_arg     = ProtoField.bytes  ("hidpp.args.arg",  "Argument")
local f_error   = ProtoField.string ("hidpp.error" ,    "Error")

-- possible arguments
local f_address         = ProtoField.uint8  ("hidpp.args.address",          "Address")
local f_value           = ProtoField.bytes  ("hidpp.args.value",            "Value")
local f_major_version   = ProtoField.uint8  ("hidpp.args.major_version",    "Control Version Major")
local f_minor_version   = ProtoField.uint8  ("hidpp.args.minor_version",    "Control Version Minor")
local f_ping_data       = ProtoField.uint8  ("hidpp.args.ping_data",        "Ping Data",    base.HEX)
local f_feature_index   = ProtoField.uint8  ("hidpp.args.feature_index",    "Feature Index")
local f_feature_type    = ProtoField.uint8  ("hidpp.args.feature_type",     "Feature Type")
local f_ft_obsolete     = ProtoField.bool   ("hidpp.args.feature_type.obsolete",    "Obsolete")
local f_ft_state        = ProtoField.uint8  ("hidpp.args.feature_type.state",        "State",   base.DEC, {
    [0] = "Suported",
    [1] = "Hidden in software",
})
local f_count           = ProtoField.uint8  ("hidpp.args.count",            "Count")
local f_feature_id      = ProtoField.uint16 ("hidpp.args.feature_id",       "Feature ID",   base.HEX)
local f_entity_count    = ProtoField.uint8  ("hidpp.args.entity_count",     "Entity Count")
local f_fw_hw_entity    = ProtoField.uint8  ("hidpp.args.fw_hw_entity",     "FW/HW Entity")
local f_fw_type         = ProtoField.uint8  ("hidpp.args.fw_type",          "FW Type",  base.DEC, {
    [0] = "Main Application",
    [1] = "Bootloader",
    [2] = "Hardware",
})
local f_fw_prefix       = ProtoField.string ("hidpp.args.fw_prefix",        "FW Prefix",    base.ASCII)
local f_fw_version      = ProtoField.float  ("hidpp.args.fw_version",       "FW Version") -- BCD Encoded!
local f_fw_build        = ProtoField.uint16 ("hidpp.args.fw_build",         "FW Build Number")
local f_fw_dyn_conf     = ProtoField.uint8  ("hidpp.args.fw_fyn_conf",      "FW Dynamic Conf")
local f_transportlayer  = ProtoField.bytes  ("hidpp.args.transport_layer",  "Transport Layer") -- Unknown length
local f_hw_version      = ProtoField.uint8  ("hidpp.args.hw_version",       "HW Version")
local f_discon_type     = ProtoField.uint8  ("hidpp.args.discon_type",      "Disconnection Type",   base.HEX, {
    [0x02] = "Device disconnected",
})
local f_protocol_type   = ProtoField.uint8  ("hidpp.args.protocol_type",    "Protocol Type",    base.HEX, {
    [0x04] = "Unifying",
})
local f_device_info     = ProtoField.uint8  ("hidpp.args.device_info",      "Device Info")
local f_wireless_pid_lsb    = ProtoField.uint8  ("hidpp.args.wireless_pid_lsb", "Wireless PID (LSB)")
local f_wireless_pid_msb    = ProtoField.uint8  ("hidpp.args.wireless_pid_msb", "Wireless PID (MSB)")
local f_locking_state   = ProtoField.uint8  ("hidpp.args.locking_state",    "Locking State",    base.DEC, {
    [0] = "Locking closed",
    [1] = "Locking open",
})
local f_error_type      = ProtoField.uint8  ("hidpp.args.error_type",       "Error Type",   base.DEC, {
    [0x00] = "No error",
    [0x01] = "Timeout",
    [0x02] = "Unsupported device",
    [0x03] = "Too many devices",
    [0x06] = "Connection sequence timeout",
})

-- device info args
local f_device_type     = ProtoField.uint8  ("hidpp.args.device_info.device_type",  "Device Type",  base.HEX, {
    [0x01] = "Keyboard",
    [0x02] = "Mouse",
    [0x03] = "Numpad",
    [0x04] = "Presenter",
    [0x08] = "Trackball",
    [0x09] = "Touchpad",
})
local f_sw_present      = ProtoField.bool   ("hidpp.args.device_info.sw_present",   "Software Present Flag")
local f_encryption      = ProtoField.uint8  ("hidpp.args.device_info.encryption",   "Encryption Status",    base.DEC, {
    [0] = "Link not encrypted",
    [1] = "Link encrypted",
})
local f_link_status     = ProtoField.uint8  ("hidpp.args.device_info.link_status",  "Link Status",  base.DEC, {
    [0] = "Link not established (out of range)",
    [1] = "Link established (in range)",
})
local f_connection_reason   = ProtoField.uint8  ("hidpp.args.device_info.connection_reason",    "Connection Reason",    base.DEC, {
    [0] = "Packet without payload",
    [1] = "Packet with payload",
})

hidpp_proto.fields = {
    f_raw,
    f_report,
    f_device,
    f_feature,
    f_fctn,
    f_ase,
    f_sw_id,
    f_args,
    f_arg,
    f_error,
    -- possible arguments
    f_address,
    f_value,
    f_major_version,
    f_minor_version,
    f_ping_data,
    f_feature_index,
    f_feature_type,
    f_ft_obsolete,
    f_ft_state,
    f_count,
    f_feature_id,
    f_entity_count,
    f_fw_hw_entity,
    f_fw_type,
    f_fw_prefix,
    f_fw_version,
    f_fw_build,
    f_fw_dyn_conf,
    f_transportlayer,
    f_hw_version,
    f_discon_type,
    f_protocol_type,
    f_device_info,
    f_wireless_pid_lsb,
    f_wireless_pid_msb,
    f_locking_state,
    f_error_type,
    -- device info args
    f_device_type,
    f_sw_present,
    f_encryption,
    f_link_status,
    f_connection_reason,
}

local hidpp_version = 2 -- default
local hidpp_version_packets = {}

-- get args
local args = { ... }
if #args ~= 0 then
    local arg = tonumber(args[1])
    if arg ~= nil and arg >= 1 and arg <= 2 then
        hidpp_version = arg
    end
end

function setlast(num, version)
    for i = num-1, 0, -1 do
        if hidpp_version_packets[i] ~= nil then
            hidpp_version_packets[i] = hidpp_version
            return
        end
    end
end

-- Dissector
function hidpp_proto.dissector(buffer, pinfo, tree)
    local length = buffer:len()

    -- remove extra info included in USB CONTROL packets
    if length == REPORT_SHORT_LEN + 7 or
        length == REPORT_LONG_LEN + 7 or
        length == REPORT_VERY_LONG_LEN + 7 or
        length == REPORT_UNK1_LEN + 7 then
            buffer = buffer(7)
            length = buffer:len()
    end

    -- debug
--    if length > 0 then
--        print("\n======= PACKET", pinfo.number)
--        print(buffer:bytes())
--    end

    if length >= REPORT_SHORT_LEN then -- minimum length
--        pinfo.cols.protocol = "CAUGHT"
        local report = buffer(0, 1):uint()

        if (report == REPORT_SHORT and length == REPORT_SHORT_LEN) or
           (report == REPORT_LONG  and length == REPORT_LONG_LEN) or
           (report == REPORT_VERY_LONG  and length == REPORT_VERY_LONG_LEN) or
           (report == REPORT_UNK1 and length == REPORT_UNK1_LEN) then
            if hidpp_version_packets[pinfo.number] == nil then
                hidpp_version_packets[pinfo.number] = hidpp_version
            end
            pinfo.cols.protocol = "HID++ " .. hidpp_version_packets[pinfo.number] .. ".0"

            -- debug
--            print("= Packet is HID++")
--            print(pinfo.src, " > ", pinfo.dst)
            local to_host = tostring(pinfo.dst) == "host"

            -- Populate data
            local device        = buffer(1, 1):uint()
            local feature       = buffer(2, 1):uint()
            local ase           = buffer(3, 1):bitfield(0, 4)
            local sw_id         = buffer(3, 1):bitfield(4, 4)
            local args          = buffer(4)
            local hidpp1_args   = buffer(3)

            local subtree = tree:add(hidpp_proto, buffer(), "HID++ Data")
            subtree:add(f_raw, buffer()) -- add raw byte for easier column visualization

            -- populate f_report
            subtree:add(f_report, report)

            -- populate other fields
            subtree:add(f_device, device)
            subtree:add(f_feature, feature)
            if hidpp_version_packets[pinfo.number] == 2 then
                subtree:add(f_ase, ase)
                subtree:add(f_sw_id, sw_id)
            end

            -- populate args
            local args_subtree
            if hidpp_version_packets[pinfo.number] == 1 then
                args_subtree = subtree:add(f_args, args())
            else
                args_subtree = subtree:add(f_args, hidpp1_args())
            end

            -- Start feature (function) check

            -- IRoot
            if feature == HIDPP2_ERR_HIDPP1 then
                if to_host then -- it's hid++ 1.0
                    subtree:add(f_fctn, "ERR_INVALID_SUBID (means it's HID++ 1.0)")
                    args_subtree:add(f_major_version, 1)
                    args_subtree:add(f_minor_version, 0)
                    -- update version
                    hidpp_version = 1
                    hidpp_version_packets[pinfo.number] = hidpp_version
                    setlast(pinfo.number, hidpp_version) -- set also previous packet, the request
                    pinfo.cols.protocol = "HID++ " .. hidpp_version .. ".0"
                else -- error
                    subtree:add(f_error, "A ERR_INVALID_SUBID packet shouldn't be sent from the host to the device")
                end
            elseif feature == FT_I_ROOT then
                if ase == 0 then -- ASE 0: featureIndex, featureType = GetFeature(featureID)
                    subtree:add(f_fctn, "featureIndex, featureType = GetFeature(featureID)")
                    if to_host then -- returns
                        args_subtree:add(f_feature_index, args:range(0, 1))
                        local ft_type_subtree = args_subtree:add(f_feature_type, args:range(1, 1):bitfield(0, 2))
                        ft_type_subtree:add(f_ft_obsolete, args:range(1, 1):bitfield(0, 1))
                        ft_type_subtree:add(f_ft_state, args:range(1, 1):bitfield(1, 1))
                    else -- parameters
                        args_subtree:add(f_feature_id, args:range(0, 2))
                    end
                elseif ase == 1 then -- ASE 1: version, ping = GetFeature(pingData)
                    subtree:add(f_fctn, "version, ping = GetFeature(pingData)")
                    if to_host then --returns
                        args_subtree:add(f_major_version, args:range(0, 1))
                        args_subtree:add(f_minor_version, args:range(1, 1))
                        -- update version
                        hidpp_version = 2
                        hidpp_version_packets[pinfo.number] = hidpp_version
                        pinfo.cols.protocol = "HID++ " .. hidpp_version .. ".0"
                        setlast(pinfo.number, hidpp_version) -- set also previous packet, the request
                    end
                    args_subtree:add(f_ping_data, args:range(2, 1)) -- used in both return and parameters
                end
            --end

            -- IFeatureSet
            elseif feature == FT_I_FEATURE_SET then
                if ase == 0 then -- ASE 0: count = GetCount()
                    subtree:add(f_fctn, "count = GetCount()")
                    if to_host then -- returns
                        args_subtree:add(f_count, args:range(0, 1))
                    end
                elseif ase == 1 then -- ASE 1: featureID, featureType = GetFeatureID(featureIndex)
                    subtree:add(f_fctn, "featureID, featureType = GetFeatureID(featureIndex)")
                    if to_host then -- returns
                        args_subtree:add(f_feature_id, args:range(0, 2))
                        local ft_type_subtree = args_subtree:add(f_feature_type, args:range(2, 1):bitfield(0, 2))
                        ft_type_subtree:add(f_ft_obsolete, args:range(2, 1):bitfield(0, 1))
                        ft_type_subtree:add(f_ft_state, args:range(2, 1):bitfield(1, 1))
                    else -- parameters
                        args_subtree:add(f_feature_index, args:range(0, 1))
                    end
                end
            --end

            -- IFirmwareInfo
            elseif feature == FT_I_FIRMWARE_INFO then
                if ase == 0 then --  ASE 0: entityCount = GetEntityCount()
                    subtree:add(f_fctn, "entityCount = GetEntityCount()")
                    if to_host then --returns
                        args_subtree:add(f_entity_count, args:range(0, 1))
                    end
                elseif ase == 1 then -- ASE 1: entity, protocol, version, build, dynamic_FWconf, transportLayer_specific_info = GetFwInfo(entity)
                    if to_host then -- returns
                        args_subtree:add(f_fw_type, args:range(0, 1):bitfield(4, 4))
                        if args:range(0, 1):bitfield(4, 4) == 0 or args:range(0, 1):bitfield(4, 4) == 1 then -- fw_type = Main Application, Bootloader
                            subtree:add(f_fctn, "entity, protocol, version, build, dynamic_FWconf, transportLayer_specific_info = GetFwInfo(entity)")
                            args_subtree:add(f_fw_prefix, args:range(1, 3))
                            args_subtree:add(f_fw_version, args_subtree(4, 2)) -- TODO: Decode BCD
                            args_subtree:add(f_fw_build, args:range(6, 2))
                            args_subtree:add(f_fw_dyn_conf, args(8, 1))
                            args_subtree:add(f_transportlayer, args(9))
                        elseif args:range(0, 1):bitfield(4, 4) == 2 then -- fw_type = Hardware
                            subtree:add(f_fctn, "hw_version = GetFwInfo(entity)")
                            args_subtree:add(f_hw_version, args(1, 1))
                        end -- TODO: other fw_type
                    else -- parameters
                        args_subtree:add(f_fw_hw_entity, args:range(0, 1))
                    end
                elseif ase == 2 then
                    -- No documentation :/
                end
            --end

            -- SetRegister
            elseif feature == FT_SET_REGISTER then
                if hidpp_version_packets[pinfo.number] == 1 then -- HID++ 1.0
                    subtree:add(f_fctn, "SetRegister(address, value)")
                    args_subtree:add(f_address, hidpp1_args(0, 1))
                    if not to_host then -- params
                        args_subtree:add(f_value, hidpp1_args(1, 3))
                    end
                end
            --end

            -- GetRegister
            elseif feature == FT_GET_REGISTER then
                if hidpp_version_packets[pinfo.number] == 1 then -- HID++ 1.0
                    subtree:add(f_fctn, "value = GetRegister(address)")
                    args_subtree:add(f_address, hidpp1_args(0, 1))
                    if to_host then -- returns
                        args_subtree:add(f_value, hidpp1_args(1, 1))
                    end
                end
            --end

            -- SetLongRegister
            elseif feature == FT_SET_LONG_REGISTER then
                if hidpp_version_packets[pinfo.number] == 1 then -- HID++ 1.0
                    subtree:add(f_fctn, "SetLongRegister(address, value)")
                    args_subtree:add(f_address, hidpp1_args(0, 1))
                    if not to_host then -- params
                        args_subtree:add(f_value, hidpp1_args(1, 16))
                    end
                end
            --end

            -- GetLongRegister
            elseif feature == FT_GET_LONG_REGISTER then
                if hidpp_version_packets[pinfo.number] == 1 then -- HID++ 1.0
                    subtree:add(f_fctn, "value = GetLongRegister(address)")
                    args_subtree:add(f_address, hidpp1_args(0, 1))
                    if to_host then -- returns
                        args_subtree:add(f_value, hidpp1_args(1, 1))
                    end
                end
            --end

            -- Device Disconnection Event
            elseif feature == FT_DEVICE_DISCONNECTION then
                if hidpp_version_packets[pinfo.number] == 1 then -- HID++ 1.0
                    subtree:add(f_fctn, "(notification)")
                    args_subtree:add(f_address, hidpp1_args(0, 1))
                    args_subtree:add(f_discon_type, hidpp1_args(1, 1))
                end
            --end

                -- Device Connection Event
            elseif feature == FT_DEVICE_DISCONNECTION then
                if hidpp_version_packets[pinfo.number] == 1 then
                    subtree:add(f_fctn, "(notification)")
                    args_subtree:add(f_address, hidpp1_args(0, 1))
                    args_subtree:add(f_protocol_type, hidpp1_args:range(0, 1):bitfield(0, 3))
                    local device_info = args_subtree:add(f_device_info, hidpp1_args(1))
                    device_info:add(f_device_type, hidpp1_args:range(1, 1):bitfield(0, 4))
                    device_info:add(f_sw_present, hidpp1_args:range(1, 1):bitfield(4, 1))
                    device_info:add(f_encryption, hidpp1_args:range(1, 1):bitfield(5, 1))
                    device_info:add(f_link_status, hidpp1_args:range(1, 1):bitfield(6, 1))
                    device_info:add(f_connection_reason, hidpp1_args:range(1, 1):bitfield(7, 1))
                    args_subtree:add(f_wireless_pid_lsb, hidpp1_args(2, 1))
                    args_subtree:add(f_wireless_pid_msb, hidpp1_args(3, 1))
                end
            --end

            -- Unifying Receiver Locking Change Information Event
            elseif feature == FT_UNIFYING_LOCK_CHANGE_INFO then
                if hidpp_version_packets[pinfo.number] == 1 then -- HID++ 1.0
                    subtree:add(f_fctn, "(notification)")
                    args_subtree:add(f_address, hidpp1_args(0, 1))
                    args_subtree:add(f_locking_state, hidpp1_args:range(1, 1):bitfield(0, 1))
                    args_subtree:add(f_error_type, hidpp1_args(2, 1))
                end
            end

        -- TODO
        end -- report check
    end -- length check

end -- hidpp_proto.dissector


-- Init routine
function hidpp_proto.init()
    -- Clear hidpp version when we start dissecting a new file
    hidpp_version_packets = {}
end

-- Subscribe the dissector
-- hid++ 2.0
DissectorTable.get("usb.interrupt"):add(IF_CLASS_UNKNOWN, hidpp_proto)
DissectorTable.get("usb.control"):add(IF_CLASS_UNKNOWN, hidpp_proto)
-- hid++ 1.0
DissectorTable.get("usb.interrupt"):add(HID, hidpp_proto)
DissectorTable.get("usb.control"):add(HID, hidpp_proto)
