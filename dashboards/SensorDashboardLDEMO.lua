base = "/DEMO/InmationBase"

function createTags() -- creates Folderstructure + Tags

    syslib.mass({
        --luaCreateTags_createItems_folder
        {
            class = syslib.model.classes.GenFolder,
            operation = syslib.model.codes.MassOp.UPSERT,
            path = base .. "/sensordashboardLDEMO",
            ["ObjectName"] = "sensordashboardLDEMO"
        },

        --luaCreateTags_createItems_actionItemFunction
        {
            class = syslib.model.classes.ActionItem,
            operation = syslib.model.codes.MassOp.UPSERT,
            path = base .. "/sensordashboardLDEMO/sensordashboardFunctionLDEMO",
            ["ObjectName"] = "sensordashboardFunctionLDEMO",
            ["ObjectDescription"] = "Sensordashboard",
		    ["AdvancedLuaScript"] = [=[
function compareLinkAndExpectedValue(link, expectedValue) --compares current Link Value and Expected Value of that tag
    if (link == expectedValue) then
        return true
    elseif (link == 1 and expectedValue == true) then --tracking mode option
        return true
    else
        return false
    end
end

function updateExpectedValue(MasterDataID) --updates Expected Value of tag depending on MasterDataID
    --luaUpdateTags_updateExpectedValues
    if MasterDataID == 12345 then
        --luaUpdateTags_updateExpectedValues_set
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Materialnummer", 12345)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Bündel Etikett", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_V-Karton Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation FS", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation Bündel", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 1", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 2", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-betrieb", True)

    end
    if MasterDataID == 12346 then
        --luaUpdateTags_updateExpectedValues_set
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Materialnummer", 12346)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Bündel Etikett", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_V-Karton Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation FS", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation Bündel", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 1", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 2", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-betrieb", True)

    end
    if MasterDataID == 12347 then
        --luaUpdateTags_updateExpectedValues_set
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Materialnummer", 12347)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Bündel Etikett", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_V-Karton Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation FS", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation Bündel", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 1", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 2", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-betrieb", True)

    end
    if MasterDataID == 12348 then
        --luaUpdateTags_updateExpectedValues_set
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Materialnummer", 12348)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Bündel Etikett", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_V-Karton Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation FS", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation Bündel", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 1", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 2", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-betrieb", True)

    end
    if MasterDataID == 12349 then
        --luaUpdateTags_updateExpectedValues_set
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Materialnummer", 12349)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Bündel Etikett", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_V-Karton Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation FS", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation Bündel", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 1", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 2", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-betrieb", False)

    end
    if MasterDataID == 12350 then
        --luaUpdateTags_updateExpectedValues_set
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Materialnummer", 12350)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Bündel Etikett", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_V-Karton Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation FS", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation Bündel", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 1", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 2", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-betrieb", False)

    end
    if MasterDataID == 12351 then
        --luaUpdateTags_updateExpectedValues_set
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Materialnummer", 12351)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Bündel Etikett", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_V-Karton Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation FS", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation Bündel", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 1", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 2", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-betrieb", False)

    end
    if MasterDataID == 12352 then
        --luaUpdateTags_updateExpectedValues_set
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Materialnummer", 12352)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Bündel Etikett", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_V-Karton Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation FS", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation Bündel", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 1", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 2", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-betrieb", True)

    end
    if MasterDataID == 12353 then
        --luaUpdateTags_updateExpectedValues_set
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Materialnummer", 12353)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Bündel Etikett", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_V-Karton Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation FS", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation Bündel", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 1", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 2", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-betrieb", True)

    end
    if MasterDataID == 12354 then
        --luaUpdateTags_updateExpectedValues_set
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Materialnummer", 12354)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Bündel Etikett", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_V-Karton Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation FS", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation Bündel", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 1", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 2", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-betrieb", False)

    end
    if MasterDataID == 12355 then
        --luaUpdateTags_updateExpectedValues_set
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Materialnummer", 12355)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Bündel Etikett", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_V-Karton Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation FS", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation Bündel", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 1", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 2", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-betrieb", False)

    end
    if MasterDataID == 12356 then
        --luaUpdateTags_updateExpectedValues_set
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Materialnummer", 12356)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Bündel Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_V-Karton Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation FS", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation Bündel", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 1", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 2", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-betrieb", False)

    end
    if MasterDataID == 12357 then
        --luaUpdateTags_updateExpectedValues_set
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Materialnummer", 12357)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Bündel Etikett", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_V-Karton Etikett", True)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation FS", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregation Bündel", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 1", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Kontrolle Aggregations-label 2", False)
        set("/DEMO/InmationBase/sensordashboardLDEMO/expectedValue_Aggregations-betrieb", False)

    end

end

function setSensordashboardValues() --sets the tags to their compared value 
    --luaUpdateTags_setSensordashboardValues
    set("/DEMO/InmationBase/sensordashboardLDEMO/sensordashboard_Bündel Etikett", compareLinkAndExpectedValue(Bündel_Etikett_link, Bündel_Etikett_expectedValue))
    set("/DEMO/InmationBase/sensordashboardLDEMO/sensordashboard_V-Karton Etikett", compareLinkAndExpectedValue(V-Karton_Etikett_link, V-Karton_Etikett_expectedValue))
    set("/DEMO/InmationBase/sensordashboardLDEMO/sensordashboard_Aggregation FS", compareLinkAndExpectedValue(Aggregation_FS_link, Aggregation_FS_expectedValue))
    set("/DEMO/InmationBase/sensordashboardLDEMO/sensordashboard_Aggregations-kontrolle", compareLinkAndExpectedValue(Aggregations-kontrolle_link, Aggregations-kontrolle_expectedValue))

end

function sleep(sleeptime) --sleep in case of inmation lag
    print("Now waiting ", sleeptime, "ms")
    syslib.sleep(sleeptime)
    print("Waiting finished...")
end

function getVariables()  --gets values for and sets all the needed variables
    --luaUpdateTags_getVariables_masterData
    masterData = get("/DEMO/InmationBase/sensordashboardLDEMO/link_MasterData")


    --luaUpdateTags_getVariables_tags
    Bündel_Etikett_link = get("/sensordashboardLDEMO/link_Bündel Etikett")
    Bündel_Etikett_expectedValue = get("/sensordashboardLDEMO/expectedValue_Bündel Etikett")
    V-Karton_Etikett_link = get("/sensordashboardLDEMO/link_V-Karton Etikett")
    V-Karton_Etikett_expectedValue = get("/sensordashboardLDEMO/expectedValue_V-Karton Etikett")
    Aggregation_FS_link = get("/sensordashboardLDEMO/link_Aggregation FS")
    Aggregation_FS_expectedValue = get("/sensordashboardLDEMO/expectedValue_Aggregation FS")
    Aggregations-kontrolle_link = get("/sensordashboardLDEMO/link_Aggregations-kontrolle")
    Aggregations-kontrolle_expectedValue = get("/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle")

end

getVariables()
sleep(3000)
updateExpectedValue(masterData)
sleep(3000)
getVariables()
sleep(3000)
setSensordashboardValues()
            ]=]
        },
        

        --luaCreateTags_createItems_masterData
        {
            class = syslib.model.classes.LinkItem,
            operation = syslib.model.codes.MassOp.UPSERT,
            path =  base .. "/sensordashboardLDEMO/link_MasterData",
            ["ObjectName"] = "link_MasterData",
            ["LinkedItem"] = "#### DEMO ####"
        },


        --luaCreateTags_createItems
        {
            class = syslib.model.classes.HolderItem,
            operation = syslib.model.codes.MassOp.UPSERT,
            path = base .. "/sensordashboardLDEMO/sensordashboard_Bündel Etikett",
            ["ObjectName"] = "sensordashboard_Bündel Etikett"
        },
        {
            class = syslib.model.classes.LinkItem,
            operation = syslib.model.codes.MassOp.UPSERT,
            path = base .. "/sensordashboardLDEMO/link_Bündel Etikett",
            ["ObjectName"] = "link_Bündel Etikett",
            ["LinkedItem"] = "/DEMO/Sw_OnOff"
        },
        {
            class = syslib.model.classes.Variable,
            operation = syslib.model.codes.MassOp.UPSERT,
            path =  base .. "/sensordashboardLDEMO/expectedValue_Bündel Etikett",
            ["ObjectName"] = "expectedValue_Bündel Etikett"
        },
        {
            class = syslib.model.classes.HolderItem,
            operation = syslib.model.codes.MassOp.UPSERT,
            path = base .. "/sensordashboardLDEMO/sensordashboard_V-Karton Etikett",
            ["ObjectName"] = "sensordashboard_V-Karton Etikett"
        },
        {
            class = syslib.model.classes.LinkItem,
            operation = syslib.model.codes.MassOp.UPSERT,
            path = base .. "/sensordashboardLDEMO/link_V-Karton Etikett",
            ["ObjectName"] = "link_V-Karton Etikett",
            ["LinkedItem"] = "/DEMO/Sw_OnOff"
        },
        {
            class = syslib.model.classes.Variable,
            operation = syslib.model.codes.MassOp.UPSERT,
            path =  base .. "/sensordashboardLDEMO/expectedValue_V-Karton Etikett",
            ["ObjectName"] = "expectedValue_V-Karton Etikett"
        },
        {
            class = syslib.model.classes.HolderItem,
            operation = syslib.model.codes.MassOp.UPSERT,
            path = base .. "/sensordashboardLDEMO/sensordashboard_Aggregation FS",
            ["ObjectName"] = "sensordashboard_Aggregation FS"
        },
        {
            class = syslib.model.classes.LinkItem,
            operation = syslib.model.codes.MassOp.UPSERT,
            path = base .. "/sensordashboardLDEMO/link_Aggregation FS",
            ["ObjectName"] = "link_Aggregation FS",
            ["LinkedItem"] = "/DEMO/Sw_OnOff"
        },
        {
            class = syslib.model.classes.Variable,
            operation = syslib.model.codes.MassOp.UPSERT,
            path =  base .. "/sensordashboardLDEMO/expectedValue_Aggregation FS",
            ["ObjectName"] = "expectedValue_Aggregation FS"
        },
        {
            class = syslib.model.classes.HolderItem,
            operation = syslib.model.codes.MassOp.UPSERT,
            path = base .. "/sensordashboardLDEMO/sensordashboard_Aggregations-kontrolle",
            ["ObjectName"] = "sensordashboard_Aggregations-kontrolle"
        },
        {
            class = syslib.model.classes.LinkItem,
            operation = syslib.model.codes.MassOp.UPSERT,
            path = base .. "/sensordashboardLDEMO/link_Aggregations-kontrolle",
            ["ObjectName"] = "link_Aggregations-kontrolle",
            ["LinkedItem"] = "/DEMO/Sw_OnOff"
        },
        {
            class = syslib.model.classes.Variable,
            operation = syslib.model.codes.MassOp.UPSERT,
            path =  base .. "/sensordashboardLDEMO/expectedValue_Aggregations-kontrolle",
            ["ObjectName"] = "expectedValue_Aggregations-kontrolle"
        },

    })

    print("Tags created!")
end

function setTriggerLink() --sets trigering links for the updater script
    --luaCreateTags_setTriggerLinks_functionLocation
    syslib.setreferences(base .. "/sensordashboardLDEMO/sensordashboardFunctionLDEMO", {


    --luaCreateTags_setTriggerLinks
        {name="link_MasterData", path="#### DEMO ####"},
        {name="link_Bündel Etikett", path="/DEMO/Sw_OnOff"},
        {name="link_V-Karton Etikett", path="/DEMO/Sw_OnOff"},
        {name="link_Aggregation FS", path="/DEMO/Sw_OnOff"},
        {name="link_Aggregations-kontrolle", path="/DEMO/Sw_OnOff"},

    })

    print("Triggering Links set!")
end

function sleep(sleeptime) --sleep in case of inmation lag
    print("Now waiting ", sleeptime, "ms")
    syslib.sleep(sleeptime)
    print("Waiting finished...")
end


createTags()
sleep(15000)
setTriggerLink()