import 'package:flutter/material.dart';

class TypeOfWorkTile extends StatefulWidget {
  const TypeOfWorkTile({super.key});

  @override
  _TypeOfWorkTileState createState() => _TypeOfWorkTileState();
}
class _TypeOfWorkTileState extends State<TypeOfWorkTile> {
  String _selectedJob = '';

  final Map<String, bool> _jobSelectionStatus = {
    'Senior UX Designer': false,
    'Senior UI Designer': false,
    'Graphic Designer': false,
    'Front-End Developer': false,
  };

  void _handleJobSelection(String selectedJob) {
    setState(() {
      _jobSelectionStatus.forEach((jobTitle, _) {
        _jobSelectionStatus[jobTitle] = jobTitle == selectedJob;
      });
      _selectedJob = selectedJob;
    });
  }

  Widget _buildJobTile(String jobTitle, bool isSelected) {
    Color tileColor = isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(10),
        color: tileColor,
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(jobTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17)),
                  const SizedBox(height: 4),
                  Text(
                    'CV.pdf • Portfolio.pdf',
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
          ),
          Radio<String>(
            value: jobTitle,
            activeColor: Colors.blue,
            groupValue: _selectedJob,
            onChanged: (String? value) {
              _handleJobSelection(value ?? '');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _jobSelectionStatus.length,
      itemBuilder: (BuildContext context, int index) {
        String jobTitle = _jobSelectionStatus.keys.elementAt(index);
        bool isSelected = _jobSelectionStatus[jobTitle] ?? false;

        return _buildJobTile(jobTitle, isSelected);
      },
    );
  }
}
