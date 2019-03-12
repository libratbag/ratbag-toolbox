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
local FT_I_FIRMWARE_INFO            = 0x0003
local FT_GET_DEVICE_NAME_TYPE       = 0x0005
local FT_RESET                      = 0x0020
local FT_SET_REGISTER               = 0x0080
local FT_GET_REGISTER               = 0x0081
local FT_SET_LONG_REGISTER          = 0x0082
local FT_GET_LONG_REGISTER          = 0x0083
local FT_BATTERY_LEVEL_SATUS        = 0x1000
local FT_LED_SW_CONTROL             = 0x1300
local FT_KBD_REPROGRAMMABLE_KEYS    = 0x1B00
local FT_SPECIAL_KEYS_BUTTONS       = 0x1B04
local FT_WIRELESS_DEVICE_SATUS      = 0x1D4B
local FT_HIRES_SCROLLING            = 0x2120
local FT_HIRES_WHEEL                = 0x2121
local FT_MOUSE_POINTER_BASIC        = 0x2200
local FT_AJUSTABLE_DPI              = 0x2201
local FT_SOLAR_KEYBOARD             = 0x4301
local FT_TOUCHPAD_FW_ITEMS          = 0x6010
local FT_TOUCHPAD_RAW_XY            = 0x6100
local FT_AJUSTABLE_REPORT_RATE      = 0x8060
local FT_COLOR_LED_EFFECTS          = 0x8070
local FT_ONBOARD_PROFILES           = 0x8100
local FT_MOUSE_BUTTON_SPY           = 0x8110
local FT_FORCE_FEEDBACK             = 0x8123

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
    [FT_I_FIRMWARE_INFO]            = "IFirmwareInfo",
    [FT_GET_DEVICE_NAME_TYPE]       = "GetDeviceNameType",
    [FT_RESET]                      = "Reset",
    [FT_SET_REGISTER]               = "SetRegister",
    [FT_GET_REGISTER]               = "GetRegister",
    [FT_SET_LONG_REGISTER]          = "SetLongRegister",
    [FT_GET_LONG_REGISTER]          = "GetLongRegister",
    [FT_BATTERY_LEVEL_SATUS]        = "BatteryLevelStatus",
    [FT_LED_SW_CONTROL]             = "LedSoftwareControl",
    [FT_KBD_REPROGRAMMABLE_KEYS]    = "KeyboardReprogrammableKeys",
    [FT_SPECIAL_KEYS_BUTTONS]       = "SpecialKeysButtons",
    [FT_WIRELESS_DEVICE_SATUS]      = "WirelessDeviceStatus",
    [FT_HIRES_SCROLLING]            = "HiResScrolling",
    [FT_HIRES_WHEEL]                = "HiResWheel",
    [FT_MOUSE_POINTER_BASIC]        = "MousePointerBasic",
    [FT_AJUSTABLE_DPI]              = "AjustableDpi",
    [FT_SOLAR_KEYBOARD]             = "SolarKeyboard",
    [FT_TOUCHPAD_FW_ITEMS]          = "TouchpadFWItems",
    [FT_TOUCHPAD_RAW_XY]            = "TouchpadRawXY",
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
}

local hidpp_version = {}

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
            pinfo.cols.protocol = "HID++"

            -- debug
--            print("= Packet is HID++")
--            print(pinfo.src, " > ", pinfo.dst)
            local to_host = tostring(pinfo.dst) == "host"

            -- Populate data
            local device    = buffer(1, 1):uint()
            local feature   = buffer(2, 1):uint()
            local ase       = buffer(3, 1):bitfield(0, 4)
            local sw_id     = buffer(3, 1):bitfield(4, 4)
            local args      = buffer(4)

            local subtree = tree:add(hidpp_proto, buffer(), "HID++ Data")
            subtree:add(f_raw, buffer()) -- add raw byte for easier column visualization

            -- populate f_report
            subtree:add(f_report, report)

            -- populate other fields
            subtree:add(f_device, device)
            subtree:add(f_feature, feature)
            subtree:add(f_ase, ase)
            subtree:add(f_sw_id, sw_id)

            -- populate args
            local args_subtree = subtree:add(f_args, args())

            -- Start feature (function) check

            -- IRoot
            if feature == HIDPP2_ERR_HIDPP1 then
                if to_host then -- it's hid++ 1.0
                    subtree:add(f_fctn, "ERR_INVALID_SUBID (means it's HID++ 1.0)")
                    args_subtree:add(f_major_version, 1)
                    args_subtree:add(f_minor_version, 0)
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
            end

            -- TODO

        end -- report check
    end -- length check

end -- hidpp_proto.dissector

-- Subscribe the dissector
-- hid++ 2.0
DissectorTable.get("usb.interrupt"):add(IF_CLASS_UNKNOWN, hidpp_proto)
DissectorTable.get("usb.control"):add(IF_CLASS_UNKNOWN, hidpp_proto)
-- hid++ 1.0
DissectorTable.get("usb.interrupt"):add(HID, hidpp_proto)
DissectorTable.get("usb.control"):add(HID, hidpp_proto)
