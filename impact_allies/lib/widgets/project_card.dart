import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../models/user_model.dart';
import '../utils/theme.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to project details
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Header
              Row(
                children: [
                  Expanded(
                    child: Text(
                      project.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(project.status),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _getStatusText(project.status),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 8),
              
              // Project Description
              Text(
                project.description,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 12),
              
              // SDG Goals
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: project.targetSDGs.take(3).map((sdg) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppTheme.primaryColor.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      'SDG ${sdg.index + 1}',
                      style: const TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
              
              const SizedBox(height: 12),
              
              // Project Info
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      project.isRemote ? 'Remote' : project.location,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.people_outline,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${project.currentParticipants.length}/${project.maxParticipants}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Required Skills
              if (project.requiredSkills.isNotEmpty) ...[
                Text(
                  'Required Skills:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: project.requiredSkills.take(4).map((skill) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        skill,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
              ],
              
              // Apply Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle apply to project
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Application submitted successfully!'),
                      ),
                    );
                  },
                  child: const Text('Apply to Project'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.planning:
        return Colors.orange;
      case ProjectStatus.active:
        return Colors.green;
      case ProjectStatus.completed:
        return Colors.blue;
      case ProjectStatus.onHold:
        return Colors.red;
    }
  }

  String _getStatusText(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.planning:
        return 'Planning';
      case ProjectStatus.active:
        return 'Active';
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.onHold:
        return 'On Hold';
    }
  }
}