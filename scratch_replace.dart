import 'dart:io';

void main() {
  final directory = Directory('lib/Compnent');
  final files = directory.listSync(recursive: true).whereType<File>();
  int mountCount = 0;
  int nullCheckCount = 0;

  for (final file in files) {
    if (file.path.endsWith('.dart')) {
      String content = file.readAsStringSync();
      bool changed = false;

      // 1. Add if (!mounted) return;
      // Many files have:
      // .then((data) {
      //   if (data != null) {
      final patternMounted = RegExp(r'\.then\(\(data\) \{\s*if \(data \!\= null\) \{');
      if (patternMounted.hasMatch(content)) {
        // Make sure it doesn't already have !mounted right before it
        if (!content.contains('if (!mounted) return;\n        if (data != null) {')) {
           content = content.replaceAll(
             patternMounted, 
             '.then((data) {\n        if (!mounted) return;\n        if (data != null) {'
           );
           changed = true;
           mountCount++;
        }
      }
      
      // Also catch if it's formatted differently
      final patternMounted2 = RegExp(r'\.then\(\(data\) \{\s*// print\(data\.body\);\s*setState\(\(\) \{');
      if (patternMounted2.hasMatch(content) && !content.contains('if (!mounted) return;')) {
           content = content.replaceAll(
             patternMounted2, 
             '.then((data) {\n        if (!mounted) return;\n          // print(data.body);\n          setState(() {'
           );
           changed = true;
           mountCount++;
      }

      // 2. Add ?.toStringAsFixed(..) ?? '--'
      // Matches things like: myData["KEY"].toStringAsFixed(0)
      final patternFixed = RegExp(r'\[([^\]]+)\]\.toStringAsFixed\(([^)]+)\)');
      if (patternFixed.hasMatch(content)) {
        content = content.replaceAllMapped(patternFixed, (match) {
          return '[${match.group(1)}]?.toStringAsFixed(${match.group(2)}) ?? \'--\'';
        });
        changed = true;
        nullCheckCount++;
      }

      // 3. Add ?.toString() ?? '--'
      // Matches things like: myData["KEY"].toString()
      final patternString = RegExp(r'\[([^\]]+)\]\.toString\(\)');
      if (patternString.hasMatch(content)) {
        content = content.replaceAllMapped(patternString, (match) {
          return '[${match.group(1)}]?.toString() ?? \'--\'';
        });
        changed = true;
        nullCheckCount++;
      }

      if (changed) {
        file.writeAsStringSync(content);
        print('Patched ${file.path}');
      }
    }
  }
  print('Added !mounted check to $mountCount files.');
  print('Added null safety to $nullCheckCount files.');
}
