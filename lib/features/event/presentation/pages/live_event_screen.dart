/* import 'package:flutter/material.dart';
import 'package:tcw/features/event/data/models/poll_model.dart';
import 'package:tcw/features/event/data/models/question_model.dart';

class LiveEventScreen extends StatefulWidget {
  final List<QuestionModel> questions;

  const LiveEventScreen({super.key, required this.questions});

  @override
  State<LiveEventScreen> createState() => _LiveEventScreenState();
}

class _LiveEventScreenState extends State<LiveEventScreen> {
  List<PollOption> pollOptions = [
    PollOption(text: "Pomodoro Technique", votes: 1),
    PollOption(text: "Eisenhower Matrix", votes: 0),
  ];

  void selectPollOption(int index) {
    setState(() {
      for (int i = 0; i < pollOptions.length; i++) {
        pollOptions[i].isSelected = i == index;
      }
      pollOptions[index].votes += 1;
    });
  }

  int get totalVotes => pollOptions.fold(0, (sum, o) => sum + o.votes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header + URL
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_back, size: 24),
                  const SizedBox(height: 8),
                  const Text(
                    'Master Time Management And\nAchieve Peak Productivity!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      Icon(Icons.link, color: Colors.orange, size: 18),
                      SizedBox(width: 4),
                      Text(
                        "www.Tcw-Event.Com/Live",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.orange,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Video area
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade300,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://img.freepik.com/free-photo/speaker-stage-conference-hall_23-2148918160.jpg'),
                ),
              ),
              child: Stack(
                children: [
                  // People & message
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.group, color: Colors.white, size: 16),
                              SizedBox(width: 4),
                              Text("15+",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.message, size: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  // Control buttons
                  Positioned(
                    bottom: 12,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.flip_camera_ios, color: Colors.white),
                        Icon(Icons.videocam, color: Colors.white),
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.call_end, color: Colors.white),
                        ),
                        Icon(Icons.mic, color: Colors.white),
                        Icon(Icons.more_horiz, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Live Questions
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Live Questions (Q&A)",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    ...widget.questions.map(
                      (q) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${q.id}- ${q.question}",
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(height: 6),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Type your answer...",
                                hintStyle: const TextStyle(fontSize: 14),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),
                    buildPollSection(),
                    
                    ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildPollSection() {
  return Container(
    margin: const EdgeInsets.only(top: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Poll Questions",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        const Text(
          "Which time management technique do you find most effective?",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Row(
          children: const [
            Icon(Icons.group, size: 14, color: Colors.grey),
            SizedBox(width: 4),
            Text(
              "Select one or more",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...pollOptions.asMap().entries.map((entry) {
          final index = entry.key;
          final option = entry.value;
          final percent =
              totalVotes == 0 ? 0.0 : option.votes / totalVotes.toDouble();

          return GestureDetector(
            onTap: () => selectPollOption(index),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      option.isSelected
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                      color:
                          option.isSelected ? Colors.amber[800] : Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        option.text,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (option.votes > 0)
                      const CircleAvatar(
                        radius: 10,
                        backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/100'), // example avatar
                      ),
                    const SizedBox(width: 4),
                    Text(
                      "${option.votes}",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  height: 6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber[800],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: percent,
                    child: Container(color: Colors.amber[300]),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        }),
      ],
    ),
  );
}

}
 */