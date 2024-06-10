# todo.rb

class ToDoList
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
    puts "Added task: #{task}"
  end

  def list_tasks
    if @tasks.empty?
      puts "No tasks available."
    else
      puts "To-Do List:"
      @tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end
  end

  def remove_task(index)
    if index >= 0 && index < @tasks.length
      removed = @tasks.delete_at(index)
      puts "Removed task: #{removed}"
    else
      puts "Invalid task number."
    end
  end
end

def show_menu
  puts "1. Add Task"
  puts "2. List Tasks"
  puts "3. Remove Task"
  puts "4. Exit"
end

todo_list = ToDoList.new

loop do
  show_menu
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter task: "
    task = gets.chomp
    todo_list.add_task(task)
  when 2
    todo_list.list_tasks
  when 3
    print "Enter task number to remove: "
    index = gets.chomp.to_i - 1
    todo_list.remove_task(index)
  when 4
    puts "Exiting..."
    break
  else
    puts "Invalid choice. Please choose again."
  end
end
