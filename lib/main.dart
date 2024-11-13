import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(SoundboardApp());
}

class SoundboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soundboard App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SoundboardScreen(),
    );
  }
}

class SoundboardScreen extends StatefulWidget {
  @override
  _SoundboardScreenState createState() => _SoundboardScreenState();
}

class _SoundboardScreenState extends State<SoundboardScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<String> soundFiles = [
    'vine boom.wav',
    'rizz-made-with-Voicemod.wav',
    'mewing-made-with-Voicemod.wav',
    'yippee-made-with-Voicemod.wav',
    'sad-hamster-made-with-Voicemod.wav',
    'whistle.wav',
  ];

  void _playSound(String soundFile) async {
    await _audioPlayer.play(AssetSource(soundFile));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('RELORCASA_CPE31 MEMES SOUNDBOARD'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: soundFiles.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () => _playSound(soundFiles[index]),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.grey,
                padding: EdgeInsets.all(16),
              ),
              child: Text('Sound ${index + 1}'),
            );
          },
        ),
      ),
    );
  }
}

