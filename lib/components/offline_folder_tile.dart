import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'dart:math';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:proto_music_player/screens/offline_folder_view.dart';

class OfflineFolderTile extends StatefulWidget {
  const OfflineFolderTile({Key? key, required this.folderModel}) : super(key: key);
  final AlbumModel folderModel;
  @override
  State<OfflineFolderTile> createState() => _OfflineFolderTileState();
}

class _OfflineFolderTileState extends State<OfflineFolderTile> {
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(18),
      color: Colors.accents.elementAt(random.nextInt(Colors.accents.length)).withOpacity(0.8),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: (){
          //push to album screen
          PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: OfflineFolderView(folderId: widget.folderModel.id,)
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.multitrack_audio_rounded,color: Colors.white,size: 40,),
            const SizedBox(height: 10,),
            Text(widget.folderModel.album,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 3,),
            const SizedBox(height: 10,),
            Text(widget.folderModel.numOfSongs.toString(),style: const TextStyle(color: Colors.white70,fontWeight: FontWeight.w600,fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
