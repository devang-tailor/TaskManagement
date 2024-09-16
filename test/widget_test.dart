import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:taskmanagement/res/exports/common_exports.dart';

// To generate mock classes, run: flutter pub run build_runner build
@GenerateMocks([TaskService])
import 'widget_test.mocks.dart';

void main() {
  group('Task Management Unit Tests', () {
    late MockTaskService mockTaskService;
    late TaskProvider taskProvider;

    setUp(() {
      // Initialize mocks and providers
      mockTaskService = MockTaskService();
      taskProvider = TaskProvider(mockTaskService);
    });

    test('Add task successfully', () async {
      // Arrange: Create a task to be added
      final Task newTask = Task(
        id: 1,
        title: 'New Task',
        description: 'Description of new task',
        isCompleted: false,
      );

      // Act: Add the task using the provider
      await taskProvider.addTask(newTask);

      // Assert: Verify that the service's addTask method was called
      verify(mockTaskService.addTask(newTask));
      verify(mockTaskService.addTask).called(1);
      expect(taskProvider.tasks.contains(newTask), true);
    });

    test('Mark task as completed', () async {
      // Arrange: Create a task and mark it as completed
      final Task taskToComplete = Task(
        id: 1,
        title: 'Incomplete Task',
        description: 'This is an incomplete task',
        isCompleted: false,
      );

      // Mock task already exists
      when(mockTaskService.getTasks())
          .thenAnswer((_) async => [taskToComplete]);

      // Act: Load tasks and mark it as completed
      await taskProvider.loadTasks();
      final updatedTask = taskToComplete.copyWith(isCompleted: true);
      await taskProvider.updateTask(updatedTask);

      // Assert: Ensure task was updated
      verify(mockTaskService.updateTask(updatedTask));
      verify(mockTaskService.updateTask).called(1);
      expect(taskProvider.tasks.first.isCompleted, true);
    });
  });
}