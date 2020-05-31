/*
JUST SOME INFORMTION FOR YOU LEECHERS OUT THERE!
AT LEAST HAVE THE ETHICAL STANDARDS TO FOLLOW MY
SOCIALS BEFORE YOU FUCK UP MY MENU!!!!

YOUTUBE: https://youtube.com/c/ItsCrazyonYT
TWITTER: https://twitter.com/XCrazyGamesHDX
SE7ENSINS: https://www.se7ensins.com/members/itscrazyyt.1331689/
DISCORD SERVER: https://discord.gg/PDK9EZs

NOTE: The Discord contains all developers of the mod menu as well as 
downloads and updates for the mod menu, from the official development
team. The Discord server also features, Suggestions, Q$A, Dev Talks,
Bugs and glitches, and a community of modders using the CrazyXV Menu

Legal Agreement (DO NOT DELETE):
This menu is subject to Copyright of ItsRealCrazy and all involved
parties, including Third-party developers. Any illegal Copies or
Piracy of the Project is subject to legal action. Any use of
this project is hereby required to give the proper credits.

Developers(DO NOT DELETE)
<-ItsRealCrazy->

{TO-DO LIST}
Create Menu Functions for the following
	Self Menu
	Fun Menu
	Aimbot Menu
	Weapon Menu
	Killstreak Menu
	All Players Menu
	Lobby Menu
	Account Menu
	Forge Menu
	Host Menu
*/
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_weapons;
#include maps\mp\gametypes\_rank;
#include maps\mp\gametypes\_teams;
#include maps\mp\gametypes\_hud;

init(){
	PrecacheShader("line_horizontal");
	PrecacheShader("menu_lobby_icon_facebook");
	PrecacheShader("specialty_fastreload_zombies");
	PrecacheShader("specialty_juggernaut_zombies");
	PrecacheShader("specialty_quickrevive_zombies");
	PrecacheShader("specialty_doubletap_zombies");
	PrecacheShader("zombies_rank_1");
	PrecacheShader("zombies_rank_2");
	PrecacheShader("zombies_rank_3");
	PrecacheShader("zombies_rank_4");
	PrecacheShader("zombies_rank_5");
	PrecacheShader("specialty_marathon_zombies");
	PrecacheShader("specialty_tombstone_zombies");
	PrecacheShader("specialty_doublepoints_zombies");
	PrecacheShader("specialty_instakill_zombies");
	PrecacheShader("code_warning_fps");
	PrecacheShader("menu_lobby_icon_twitter");
	PrecacheShader("ui_scrollbar_arrow_up_a");
	PrecacheShader("gradient_top");
	PrecacheShader("hud_status_connecting");
	PrecacheShader("line_vertical");
	PrecacheShader("gradient_fadein");
	PrecacheShader("overlay_tag_it");
	PrecacheShader("menu_camo_mtx_dragon");
	PrecacheShader("gradient");
	PrecacheShader("gradient_bottom");
	PrecacheShader("gradient_center")
	PrecacheShader("");
	PrecacheShader("");
	PrecacheShader("");
	level thread onPlayerConnect();
	level.clientid = 0;
	level.result = 0;
}
onPlayerConnect(){
    for (;;){
    	level waittill("connected", player);
    	player.MenuInit = false;

    if (player isHost())
 		player.status = "Host";
	
	else
 		player.status = "Unverified";

    if (player isVerified())
 		player giveMenu();
    	player thread onPlayerSpawned();
    	player.clientid = level.clientid;
    	level.clientid++;
	}
}

onPlayerSpawned(){
    self endon("disconnect");
    level endon("game_ended");
    isFirstSpawn = true;
    self freezecontrols(false);
    for (;;){
	        self waittill("spawned_player");
	    if (isFirstSpawn){
	        if (self isHost()){
	            thread overflowfix();
	        }
	        isFirstSpawn = false;
	    }
	    if (self isHost()){
	        self iprintln("^2Press [{+speed_throw}] + [{+melee}] To Open Mod Menu");
	    }
	    if (self isVerified()){
			self iprintln("^2Press [{+speed_throw}] + [{+melee}] To Open Mod Menu");
	    }
	}
}
CreateMenu(){
	//Main Menu
	self add_menu("Home", undefined, "Verified");
	self add_option("Home", "Self Menu", ::submenu, "Self Menu", "Self Menu");
	self add_option("Home", "Fun Menu", ::submenu, "Fun Menu", "Fun Menu");
	self add_option("Home", "Aimbot Menu", ::submenu, "Aimbot Menu", "Aimbot Menu");
	self add_option("Home", "Weapon Menu", ::submenu, "Weapon Menu", "Weapon Menu");
	self add_option("Home", "All Players Menu", ::submenu, "All Players Menu", "All Players Menu");
	self add_option("Home", "Lobby Menu", ::submenu, "Lobby Menu", "Lobby Menu");
	self add_option("Home", "Text Menu", ::submenu, "Text Menu", "Text Menu");
	self add_option("Home", "Map Menu", ::sub,enu, "Map Menu", "Map Menu");
	self add_option("Home", "Account Menu", ::submenu, "Account Menu", "Account Menu");
	self add_option("Home", "Forge Menu", ::submenu, "Forge Menu", "Forge Menu");
	self add_option("Home", "Host Menu", ::submenu, "Host Menu", "Host Menu");
	self add_option("Home", "User Suggested Menu", ::submenu, "User Suggested Menu", "User Suggested Menu");
	self add_option("Home", "Menu Settings", ::submenu, "Menu Settings", "Menu Settings");
	
	//Self Menu
	self add_menu("Self Menu", "Home", "Verified");
	self add_option("Self Menu", "God  Mode", ::GodMode);
	self add_option("Self Menu", "Infinite Ammo", ::InfiniteAmmo);
	self add_option("self Menu", "Field of view", ::ToggleFOV1);
	self add_option("Self Menu", "Change Vision", ::ToggleVision);
	self add_option("Self Menu", "Toggle FPS", ::ToggleFPS);
	self add_option("Self Menu", "No Clip", ::ToggleNoclip);
	self add_option("Self Menu", "Respawn (S&D)", ::S&DRespawn);
	self add_option("Self Menu", "Quick Reload", ::QuickReload);
	self add_option("Self Menu", "Give All Perks", ::GivePerks);
	self add_option("Self Menu", "Invisible", ::Invis);
	self add_option("Self Menu", "Third Person", ::thirdperson);
	self add_option("Self Menu", "Auto Dropshot", ::AutoDropshot);
	self add_option("Self Menu", "Flash Feed", ::flashfeed2);
	self add_option("Self Menu", "Drop Cansawap", ::DropCanswap);
	self add_option("Self Menu", "Save/Load", ::SaveLoad);
	self add_option("Self Menu", "Suicide", ::kys);
	self add_option("Self Menu", "UAV", ::toggleuav);
	self add_option("Self Menu", "Clone Yourself", ::cloneyourself);
	
	//Fun Menu
	self add_menu("Fun Menu", "Home", "VIP");
	self add_option("Fun Menu", "Drivable Car", ::DriveableCar);
	self add_option("Fun Menu", "2X Speed", ::DoubleSpd);
	//self add_option("Fun Menu", "Super Jump", ::SuperJump); BUGGED (DISABLED FOR FIXES)
	self add_option("Fun Menu", "Toggle Game Speed", ::ToggleGameSpd);
	self add_option("Fun Menu", "Gravity", ::Gravity);
	self add_option("Fun Menu", "Flash Feed", ::FlashFeed);
	self add_option("Fun Menu", "Health Bar", ::ToggleHealthBar);

	//Aimbot Menu
	self add_menu("Aimbot Menu", "Home", "Verified");
	self add_option("Aimbot Menu", "Trickshot Aimbot", ::Trickshot);
	self add_option("Aimbot Menu", "Unfair Aimbot", ::Unfair);
	
	//Weapon Menu
	self add_menu("Weapon Menu", "Home", "Verified");
	self add_option("Weapon Menu", "Unlock All Camos", ::UnlockAllCamo);
	self add_option("Weapon Menu", "Rapid Fire", ::rapidfire);
	self add_option("Weapon Menu", "Change Class", ::ClassChg);
	self add_option("Weapon Menu", "RPG Bullets", ::initrpgbullet);
	self add_option("Weapon Menu", "Give Minigun", ::GiveMinigun);
	self add_option("Weapon Menu", "Swarm Gun", ::toggleswarmgun);
	
	//All Players Menu
	self add_menu("All Players Menu", "Home", "Co-Host");
	self add_option("All Players Menu", "Freeze All", ::freezeall);
	self add_option("All Players Menu", "Give Godmode", ::godmodeall);
	self add_option("All Players Menu", "Give Unlimited Ammo", ::infiniteammoall);
	self add_option("All Players Menu", "Teleport all to me", ::alltome);
	self add_option("All Players Menu", "Send all to space", ::sendalltospace);
	self add_option("All Players Menu", "Kill everyone", ::allplayerskilled);
	self add_option("All Players Menu", "Teleport all to crosshairs", ::teletocrosshairs);
	self add_option("All Players Menu", "Give everyone Minigun", ::giveallminigun);
	self add_option("All Players Menu", "Kick  Everyone", ::kickall);
	self add_option("All Players Menu", "Hear Everyone", ::hearallplayers);
	
	
	//Lobby Menu
	self add_menu("Lobby Menu", "Home", "Host");
	self add_option("Lobby Menu", "Spawn 1 Bot", ::Spawn1Bot);
	self add_option("Lobby Menu", "Spawn 3 Bots", ::Spawn3Bots);
	self add_option("Lobby Menu", "Spawn Max Bots", ::SpawnMaxBots);
	self add_option("Lobby Menu", "Toggle Skies", ::dosky);
	self add_option("Lobby Menu", "");
	self add_option("Lobby Menu", "");
	self add_option("Lobby Menu", "");
	
	//Text Menu
	self add_menu("Text Menu", "Home", "Verified");
	self add_option("Text Menu", "Creator", ::doCreator);
	self add_option("Text Menu", "Host", ::doHost);
	self add_option("Text Menu", "Say Hi", ::Hello, "^3" + self.name + ": ^5Says Hi");
	self add_option("Text Menu", "Whos Modding?", "^3" + self.name + "^5 Is MODDING?!?!");
	self add_option("Text Menu", "");
	self add_option("Text Menu", "");
	self add_option("Text Menu", "");
	
	//Map Menu
	self add_menu("Map Menu", "Home", "Host");
	self add_option( "Map Menu", "Aftermath", ::domap, "mp_la" );
	self add_option( "Map Menu", "Carrier", ::domap, "mp_carrier" );
	self add_option( "Map Menu", "Cargo", ::domap, "mp_dockside" );
	self add_option( "Map Menu", "Drone", ::domap, "mp_drone" );
	self add_option( "Map Menu", "Express", ::domap, "mp_express" );
	self add_option( "Map Menu", "Hijacked", ::domap, "mp_hijacked" );
	self add_option( "Map Menu", "Meltdown", ::domap, "mp_meltdown" );
	self add_option( "Map Menu", "Nuketown", ::domap, "mp_nuketown_2020" );
	self add_option( "Map Menu", "Overflow", ::domap, "mp_overflow" );
	self add_option( "Map Menu", "Plaza", ::domap, "mp_nightclub" );
	self add_option( "Map Menu", "Raid", ::domap, "mp_raid" );
	self add_option( "Map Menu", "Slums", ::domap, "mp_slums" );
	self add_option( "Map Menu", "Standoff", ::domap, "mp_village" );
	self add_option( "Map Menu", "Turbine", ::domap, "mp_turbine" );
	self add_option( "Map Mmenu", "Yemen", ::domap, "mp_socotra" );
	
	//Account Menu
	self add_menu("Account Menu", "Home", "Verified");
	self add_option("Account Menu", "Unlock Achievements", ::UnlockAchieve);
	self add_option("Account Menu", "");
	self add_option("Account Menu", "");
	self add_option("Account Menu", "");
	self add_option("Account Menu", "");
	self add_option("Account Menu", "");
	self add_option("Account Menu", "");
	
	//Forge Menu
	self add_menu("Forge Menu", "Home", "Admin");
	self add_option("Forge Menu", "Forge Mode", ::ForgeMode);
	self add_option("Forge Menu", "Advandcd Forge Mode", ::advForgeMode);
	self add_option("Forge Menu", "");
	self add_option("Forge Menu", "");
	self add_option("Forge Menu", "");
	self add_option("Forge Menu", "");
	self add_option("Forge Menu", "");
	
	//Host Menu
	self add_menu("Host Menu", "Home", "Host");
	self add_option("Host Menu", "Force Host", ::ForceHost);
	self add_option("Host Menu", "Restart Map", ::dorestart);
	self add_option("Host Menu", "Anti Quit", ::toggleantiquit);
	self add_option("Host Menu", "End Game");
	self add_option("Host Menu", "");
	self add_option("Host Menu", "");
	self add_option("Host Menu", "");
	
	//UserSugg Menu
	self add_menu("User Suggested Menu", "Home", "Verified");
	self add_option("User Suggested Menu", "");
	self add_option("User Suggested Menu", "");
	self add_option("User Suggested Menu", "");
	self add_option("User Suggested Menu", "");
	self add_option("User Suggested Menu", "");
	self add_option("User Suggested Menu", "");
	self add_option("User Suggested Menu", "");

	//Menu Setting Menu
	self add_menu("Settings", "Home", "Verified");
	self add_option("Settings Menu", "Rainbow Shaders", ::RainbowShaders);
	self add_option("Settings Menu", "Red Menu", ::RedMenu);
	self add_option("Settings Menu", "Blue Menu", ::BlueMenu);
	self add_option("Settings Menu", "Green Menu", ::GreenMenu);
	self add_option("Settings Menu", "Black Menu", ::BlackMenu);
	self add_option("Settings Menu", "White Menu", ::WhiteMenu);
	self add_option("Settings Menu", "Stealth Mode", ::StealthMode);

}
overflowfix()
{
        level endon("game_ended");
        level.test = createServerFontString("default", 1.5);
        level.test setText("CrazyXV");
        level.test.alpha = 0;
        for (;;)
        {
            level waittill("textset");
        if (level.result >= 50)
        {
            level.test ClearAllTextAfterHudElem();
            level.result = 0;
            foreach (player in level.players){
                if (player.menu.open == true)
                {
                    player recreateText();
                }
            }
        }
        wait 0.01;
		}
}
recreateText()
{
    self endon("disconnect");
    self endon("death");		
    input = self.CurMenu;
    title = self.CurTitle;
    self thread submenu(input, title);
}
giveMenu()
{
    if (self isVerified())
     {
        if (!self.MenuInit)
        {
            self.MenuInit = 1;
            self thread MenuInit();
        }
    }
}
isVerified()
{
    if (self.status == "Host" || self.status == "Verified" || self.status == "VIP" || self.status == "Admin" || self.status == "Co-Host")
    {
        return true;
    }
    else
    {
        return false;
    }
}
drawText(text, font, fontScale, x, y, color, alpha, glowColor, glowAlpha, sort)
{
    hud = self createFontString(font, fontScale);
    hud setText(text);
    hud.x = x;
    hud.y = y;
    hud.color = color;
    hud.alpha = alpha;
    hud.glowColor = glowColor;
    hud.glowAlpha = glowAlpha;
    hud.sort = sort;
    hud.alpha = alpha;
    level.result += 1;
    hud setText(text);
    level notify("textset");		
    return hud;
}		
drawShader(shader, x, y, width, height, color, alpha, sort)
{
    hud = newClientHudElem(self);
    hud.elemtype = "icon";
    hud.color = color;
    hud.alpha = alpha;
    hud.sort = sort;
    hud.children = [];
    hud setParent(level.uiParent);
    hud setShader(shader, width, height);
    hud.x = x;
    hud.y = y;
    return hud;
}	
changeVerificationMenu(player, verlevel)
{
    if (player.status != verlevel && !player isHost())
    {
        player notify("statusChanged");
        player.status = verlevel;
        wait 0.05;
        player giveMenu();		
        if (player.status == "Unverified")
        {
            player thread destroyMenu(player);
        }
        if (player isVerified())
        {
            self iprintln(getPlayerName(player) +" Is Now " + verificationToColor(verlevel));
            player iPrintln("You Are Now  " + verificationToColor(verlevel));
            player iprintln("Press [{+speed_throw}] + [{+melee}] To Open Mod Menu");
        }
    }
     else{
        if (player isHost())
        	self iPrintln("You Cannot Change The Access Level of The " + verificationToColor(player.status));
        else
            self iPrintln(getPlayerName(player) +" Is Already Set To " + verificationToColor(verlevel));
    }
}		
changeVerification(player, verlevel)
{
    player notify("statusChanged");
    player.status = verlevel;
    wait 0.05;
    player giveMenu();		
    if (player.status == "Unverified")
    {
        player thread destroyMenu(player);
    }
    if (player isVerified())
    {
        player iPrintln("You Are Now  " + verificationToColor(verlevel));
        player iprintln("Press [{+speed_throw}] + [{+melee}] To Open");
    }
}		
getPlayerName(player)
{
    playerName = getSubStr(player.name, 0, player.name.size);
    for (i = 0; i < playerName.size; i++)
    {
    	if (playerName[i] == "]")
            break;
    }
    if (playerName.size != i)
        playerName = getSubStr(playerName, i + 1, playerName.size);
    return playerName;
}

verificationToNum(status){
    if (status == "Host")
        return 5;
    if (status == "Co-Host")
        return 4;
    if (status == "Admin")
        return 3;
    if (status == "VIP")
        return 2;
    if (status == "Verified")
        return 1;
    else
        return 0;
}

verificationToColor(status)
{
    if (status == "Host")
        return "^1Host";
    if (status == "Co-Host")
        return "^2Co-Host";
    if (status == "Admin")
        return "^3Admin";
    if (status == "VIP")
        return "^4VIP";
    if (status == "Verified")
        return "^5Verified";
    else
        return "^6Unverified";
}		
Iif(bool, rTrue, rFalse)
{
    if (bool)
        return rTrue;
    else
        return rFalse;
}		
booleanReturnVal(bool, returnIfFalse, returnIfTrue)
{
    if (bool)
        return returnIfTrue;
    else
        return returnIfFalse;
}		
booleanOpposite(bool){
    if (!isDefined(bool))
        return true;
    if (bool)
        return false;
    else
        return true;
}
updatePlayersMenu()
{
    self.menu.menucount["PlayersMenu"] = 0;
    for (i = 0; i < level.players.size; i++)
    {
        player = level.players[i];
        playerName = getPlayerName(player);		
        playersizefixed = level.players.size - 1;
        if (self.menu.curs["PlayersMenu"] > playersizefixed)
        {
            self.menu.scrollerpos["PlayersMenu"] = playersizefixed;
            self.menu.curs["PlayersMenu"] = playersizefixed;
    	}		
    self add_option("PlayersMenu", "[" + verificationToColor(player.status) + "^7] " + playerName, ::submenu, "pOpt " + i, "[" + verificationToColor(player.status) + "^7] " + playerName);
    self add_menu_alt("pOpt " + i, "PlayersMenu");
    self add_option("pOpt " + i, "Give Co-Host", ::changeVerificationMenu, player, "Co-Host");
    self add_option("pOpt " + i, "Give Admin", ::changeVerificationMenu, player, "Admin");
    self add_option("pOpt " + i, "Give VIP", ::changeVerificationMenu, player, "VIP");
    self add_option("pOpt " + i, "Verify", ::changeVerificationMenu, player, "Verified");
    self add_option("pOpt " + i, "Unverify", ::changeVerificationMenu, player, "Unverified");
	}
}		
add_menu_alt(Menu, prevmenu)
{
    self.menu.getmenu[Menu] = Menu;
    self.menu.menucount[Menu] = 0;
    self.menu.previousmenu[Menu] = prevmenu;
}		
add_menu(Menu, prevmenu, status)
{
    self.menu.status[Menu] = status;
    self.menu.getmenu[Menu] = Menu;
    self.menu.scrollerpos[Menu] = 0;
    self.menu.curs[Menu] = 0;
    self.menu.menucount[Menu] = 0;
    self.menu.previousmenu[Menu] = prevmenu;
}		
add_option(Menu, Text, Func, arg1, arg2)
{
    Menu = self.menu.getmenu[Menu];
    Num = self.menu.menucount[Menu];
    self.menu.menuopt[Menu][Num] = Text;
    self.menu.menufunc[Menu][Num] = Func;
    self.menu.menuinput[Menu][Num] = arg1;
    self.menu.menuinput1[Menu][Num] = arg2;
    self.menu.menucount[Menu] += 1;
}		
updateScrollbar()
{
    self.menu.scroller MoveOverTime(0.10);
    self.menu.scroller.y = 68 + (self.menu.curs[self.menu.currentmenu] * 19.20);
    self.menu.scroller.archived = false;
}		
openMenu()
{
    self freezeControls(false);		
    self setClientUiVisibilityFlag("hud_visible", 0);
    self StoreText("Main Menu", "Main Menu");				
    self.menu.background FadeOverTime(0.30);
    self.menu.background.alpha = 255;
    self.menu.background.archived = false;		
    self.menu.background1 FadeOverTime(0.30);
    self.menu.background1.alpha = 0.80;
    self.menu.background1.archived = false;		
    self.swagtext FadeOverTime(0.3);
    self.swagtext.alpha = 0.90;		
    self.menu.line MoveOverTime(0.30);
    self.menu.line.y = 40;
    self.menu.line.archived = false;
    self.menu.line2 MoveOverTime(0.30);
    self.menu.line2.y = 40;
    self.menu.line2.archived = false;		
    self.menu.header FadeOverTime(0.3);
    self.menu.header.alpha = 0.90;		
    self.menu.header2 FadeOverTime(0.3);
    self.menu.header2.alpha = 0.90;		
    self updateScrollbar();
    self.menu.open = true;
}		
closeMenu()
{
    self.menu.options FadeOverTime(0.3);
    self.menu.options.alpha = 0;
    self setClientUiVisibilityFlag("hud_visible", 1);		
    self.statuss FadeOverTime(0.3);
    self.statuss.alpha = 0;		
    self.tez FadeOverTime(0.3);
    self.tez.alpha = 0;		
    self.menu.background FadeOverTime(0.3);
    self.menu.background.alpha = 0;		
    self.menu.background1 FadeOverTime(0.3);
    self.menu.background1.alpha = 0;		
    self.swagtext FadeOverTime(0.30);
    self.swagtext.alpha = 0;		
    self.menu.title FadeOverTime(0.30);
    self.menu.title.alpha = 0;		
    self.menu.line MoveOverTime(0.30);
    self.menu.line.y = -550;
    self.menu.line2 MoveOverTime(0.30);
    self.menu.line2.y = -550;		
    self.menu.header FadeOverTime(0.3);
    self.menu.header.alpha = 0;				
    self.menu.header2 FadeOverTime(0.3);
    self.menu.header2.alpha = 0;						
    self.menu.scroller MoveOverTime(0.30);
    self.menu.scroller.y = -510;
    self.menu.open = false;
}		
destroyMenu(player)
{
    player.MenuInit = false;
    closeMenu();
    wait 0.3;		
    player.menu.options destroy();
    player.menu.background1 destroy();
    player.menu.scroller destroy();
    player.menu.scroller1 destroy();
    player.infos destroy();
    player.menu.line destroy();
    player.menu.line2 destroy();
    player.menu.title destroy();
    self.menu.header destroy();
    self.menu.header2 destroy();
    player notify("destroyMenu");
}
removeskybarrier()
{
	entArray = getEntArray();
	for(index = 0; index < entArray.size; index++)
	{
		if(isSubStr(entArray[index].classname, "trigger_hurt") && entArray[index].origin[2] > 180) entArray[index].orgin = (0, 0, 9999999);
	}
}
deathbarrier()
{
	ents = getEntArray();
	for(index = 0; index < ents.size; index++)
	{
		if(isSubStr(ents[index].classname, "trigger_hurt")) ents[index].orgin = (0, 0, 9999999);
	}
}
closeMenuOnDeath()
{
    self endon("disconnect");
    self endon( "destroyMenu" );
    level endon("game_ended");
    for (;;)
    {
    	self waittill("death");
    	self.menu.closeondeath = true;
    	self submenu("Main Menu", "Main Menu");
    	closeMenu();
    	self.menu.closeondeath = false;
	}
}		
StoreShaders()
{
    self.menu.background = self drawShader("white", 235, 60, 200, 300,(0,0,1), 0, 0);
    self.menu.scroller = self drawShader("white", 236, -100, 200, 17, (0,0,1), 255, 1);
    self.menu.line = self drawShader("white", 336, -1000, 3, 370, (0,0,1), 255, 2);
    self.menu.line2 = self drawShader("white", 135, -1000, 3, 370, (0,0,1), 255, 3);
    self.menu.header = self drawShader("menu_camo_mtx_dragon", 235, 40, 200, 20, (0,0,1), 0, 4);
    self.menu.header2 = self drawShader("white", 235, 360, 200, 50, (0,0,1), 0, 5);		
}

StoreText(menu, title)
{
    self.menu.currentmenu = menu;
    string = "";
    self.menu.currentmenu = input;
    self.menu.title destroy();
    self.menu.title = drawText(title, "default", 1.6, 235, 38, (1,1,1), 0, (1,1,1), 255, 4);
    self.menu.title FadeOverTime(0.3);
    self.menu.title.alpha = 1;
    self.menu.title.archived = false;
    self notify("stopScale");		
    self.tez destroy();
    self.tez = self createFontString("default", 2.5);
    self.tez setPoint( "CENTER", "TOP", 235, 375);
    self.tez setText(" Crazy XV1 ");
    self.tez FadeOverTime(0.3);
    self.tez.alpha = 1;
    self.tez.foreground = true;
    self.tez.archived = false;
    self.tez.glowAlpha = 0;
    for (i = 0; i < self.menu.menuopt[menu].size; i++)
    {
    	string += self.menu.menuopt[menu][i] + "\n"; 
    }
    self.statuss destroy();
    self.statuss = self createFontString("default", 1.3);
    self.statuss setPoint( "CENTER", "TOP", 235, 396);
    self.statuss setText("ItsRealCrazy");
    self.statuss FadeOverTime(0.3);
    self.statuss.alpha = 1;
    self.statuss.foreground = true;
    self.statuss.archived = false;
    self.statuss.glowAlpha = 0;
	self.menu.options destroy();
    self.menu.options = drawText(string, "objective", 1.6, 265, 68, (1,1,1), 0, (0, 0, 0), 0, 4);
    self.menu.options FadeOverTime(0.3);
    self.menu.options.archived = false;
    self.menu.options.alpha = 1;
    self.menu.options setPoint( "LEFT", "LEFT", 503, -128 );		
}		
MenuInit()
{
    self endon("disconnect");
    self endon( "destroyMenu" );
    level endon("game_ended");		
    self.menu = spawnstruct();
    self.toggles = spawnstruct();		
    self.menu.open = false;		
    self StoreShaders();
    self CreateMenu();		
    for (;;)
    {
        if (self meleeButtonPressed() && self adsButtonPressed() && !self.menu.open)
        {
        	openMenu();
    	}
    if (self.menu.open)
    {
        if (self useButtonPressed())
        {
        	self PplaySoundToPlayer("uin_main_exit");
            if (isDefined(self.menu.previousmenu[self.menu.currentmenu]))
            {
                self submenu(self.menu.previousmenu[self.menu.currentmenu]);
            }
            else
            {
                closeMenu();
            }
            wait 0.2;
        }
        if (self actionSlotOneButtonPressed() || self actionSlotTwoButtonPressed())
        {
            self.menu.curs[self.menu.currentmenu] += (Iif(self actionSlotTwoButtonPressed(), 1, -1));
            self.menu.curs[self.menu.currentmenu] = (Iif(self.menu.curs[self.menu.currentmenu] < 0, self.menu.menuopt[self.menu.currentmenu].size - 1, Iif(self.menu.curs[self.menu.currentmenu] > self.menu.menuopt[self.menu.currentmenu].size - 1, 0, self.menu.curs[self.menu.currentmenu])));		
            self PlaySoundToPlayer("uin_main_nav", self);
            self updateScrollbar();
        }
        if (self jumpButtonPressed())
        {
        	self PlaySoundToPlayer("uin_main_enter", self);
            self thread[[self.menu.menufunc[self.menu.currentmenu] [self.menu.curs[self.menu.currentmenu]]]](self.menu.menuinput[self.menu.currentmenu][self.menu.curs[self.menu.currentmenu]], self.menu.menuinput1[self.menu.currentmenu][self.menu.curs[self.menu.currentmenu]]);
			wait 0.2;
			}
		}
		wait 0.05;
	}
}				
submenu(input, title)
{
    if (verificationToNum(self.status) >= verificationToNum(self.menu.status[input]))
    {
        self.menu.options destroy();		
        if (input == "Main Menu")
            self thread StoreText(input, "Main Menu");
		else if (input == "PlayersMenu")
		{
            self updatePlayersMenu();
            self thread StoreText(input, "Players");
        }
        else
        self thread StoreText(input, title);	
        self.CurMenu = input;
        self.CurTitle = title;
        self.menu.scrollerpos[self.CurMenu] = self.menu.curs[self.CurMenu];
        self.menu.curs[input] = self.menu.scrollerpos[input];
        level.result += 1;
        level notify("textset");
        if (!self.menu.closeondeath)
        {
            self updateScrollbar();
        }
    }
    else
    {
        player iPrintln("Only Players With ^2" + verificationToColor(self.menu.status[input]) + " ^7Can Access This Menu!");
    }
}
vector_scal(vec, scale)
{
	vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
	return vec;
}
















