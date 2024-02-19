// Copyright (C) 2024 Katsute | Licensed under CC BY-NC-SA 4.0

#pragma semicolon 1

#include <sourcemod>
#include <sdktools>
#include <tf2>
#include <tf2_stocks>

public Plugin myinfo = {
    name        = "Premium Upgrades",
    author      = "Katsute",
    description = "Premium upgrade station for MVM",
    version     = "1.0",
    url         = "https://github.com/KatsuteTF/MVM-Premium-Upgrades"
}

public void OnPluginStart(){
    HookEvent("teamplay_round_start", OnStart);
}

public void OnStart(const Event event, const char[] name, const bool dontBroadcast){
    Upgrades_Normal();
}

public Action OnClientSayCommand(int client, const char[] command, const char[] args){

    if(strcmp(args, "!normal") == 0){
        Upgrades_Normal();
    }else if(strcmp(args, "!class") == 0){
        Upgrades_Class(TFClassType:TF2_GetPlayerClass(client));
    }else if(strcmp(args, "!premium") == 0){
        Upgrades_Premium();
    }else if(strcmp(args, "!support") == 0){
        Upgrades_Support();
    }else if(strcmp(args, "!package") == 0){
        Upgrades_Package();
    }
    return Plugin_Handled;
}

public void SetCustomUpgradeFile(const char[] file){
    SetVariantString(file);
    AcceptEntityInput(FindEntityByClassname(-1, "tf_gamerules"), "SetCustomUpgradesFile");
}

public void Upgrades_Normal(){
    SetCustomUpgradeFile("scripts/items/mvm_upgrades.txt");
    PrintToChatAll("Changed upgrade station to %s", "Normal");
}

public void Upgrades_Premium(){
    SetCustomUpgradeFile("scripts/ma_pu/mvm_pu.txt");
    PrintToChatAll("Changed upgrade station to %s", "Premium");
}

public void Upgrades_Support(){
    SetCustomUpgradeFile("scripts/ma_pu/mvm_pu_po.txt");
    PrintToChatAll("Changed upgrade station to %s", "Support");
}

public void Upgrades_Package(){
    SetCustomUpgradeFile("scripts/ma_pu/mvm_pu_pa.txt");
    PrintToChatAll("Changed upgrade station to %s", "Package");
}

public void Upgrades_Class(const TFClassType class){
    if(class == TFClass_Scout){
        SetCustomUpgradeFile("scripts/ma_pu/mvm_pu_scout.txt");
        PrintToChatAll("Changed upgrade station to %s", "Scout");
    }else if(class == TFClass_Soldier){
        SetCustomUpgradeFile("scripts/ma_pu/mvm_pu_soldier.txt");
        PrintToChatAll("Changed upgrade station to %s", "Soldier");
    }else if(class == TFClass_Pyro){
        SetCustomUpgradeFile("scripts/ma_pu/mvm_pu_pyro.txt");
        PrintToChatAll("Changed upgrade station to %s", "Pyro");
    }else if(class == TFClass_DemoMan){
        SetCustomUpgradeFile("scripts/ma_pu/mvm_pu_demoman.txt");
        PrintToChatAll("Changed upgrade station to %s", "Demoman");
    }else if(class == TFClass_Heavy){
        SetCustomUpgradeFile("scripts/ma_pu/mvm_pu_heavy.txt");
        PrintToChatAll("Changed upgrade station to %s", "Heavy");
    }else if(class == TFClass_Engineer){
        SetCustomUpgradeFile("scripts/ma_pu/mvm_pu_engineer.txt");
        PrintToChatAll("Changed upgrade station to %s", "Engineer");
    }else if(class == TFClass_Medic){
        SetCustomUpgradeFile("scripts/ma_pu/mvm_pu_medic.txt");
        PrintToChatAll("Changed upgrade station to %s", "Medic");
    }else if(class == TFClass_Sniper){
        SetCustomUpgradeFile("scripts/ma_pu/mvm_pu_sniper.txt");
        PrintToChatAll("Changed upgrade station to %s", "Sniper");
    }else if(class == TFClass_Spy){
        SetCustomUpgradeFile("scripts/ma_pu/mvm_pu_spy.txt");
        PrintToChatAll("Changed upgrade station to %s", "Spy");
    }
}