#include <YSI_Coding\y_hooks>

CMD:musica(playerid, params[]){
    new musicName[35];
    if(sscanf(params, "s[35]", musicName))  return SendClientMessage(playerid, -1, "/musica nome da música");
    if(PlayMusic(playerid, musicName)) SendClientMessage(playerid, -1, "Tocando!");
	return 1;
}
CMD:parar(playerid, params[]){
    StopAudioStreamForPlayer(playerid);
    return 1;
}
forward PlayMusic(playerid, musicName[]);
public PlayMusic(playerid, musicName[]){
    new url2[128];
    format(url2, sizeof(url2), "http://localhost:3001/musicas/%s", musicName); 
    PlayAudioStreamForPlayer(playerid, url2);
    return 1;
}