require 'tk'

class ToDoList
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
  end

  def remove_task(index)
    @tasks.delete_at(index) if index && index >= 0 && index < @tasks.length
  end

  def tasks
    @tasks
  end
end

class ToDoApp
  def initialize(root)
    @root = root
    @root.title = "To-Do List"

    @todo_list = ToDoList.new

    @frame = TkFrame.new(@root) do
      padx 15
      pady 15
      pack('side' => 'top', 'fill' => 'both', 'expand' => true)
    end

    @entry = TkEntry.new(@frame) do
      width 40
      pack('side' => 'left')
    end

    @add_button = TkButton.new(@frame) do
      text "Add Task"
      pack('side' => 'left')
    end
    @add_button.command { add_task }

    @task_listbox = TkListbox.new(@frame) do
      height 10
      width 50
      pack('side' => 'top', 'fill' => 'both', 'expand' => true)
    end

    @remove_button = TkButton.new(@frame) do
      text "Remove Task"
      pack('side' => 'bottom')
    end
    @remove_button.command { remove_task }
  end

  def add_task
    task = @entry.value.strip
    unless task.empty?
      @todo_list.add_task(task)
      update_listbox
      @entry.value = ""
    end
  end

  def remove_task
    selected_index = @task_listbox.curselection.first
    if selected_index
      @todo_list.remove_task(selected_index)
      update_listbox
    end
  end

  def update_listbox
    @task_listbox.delete(0, 'end')
    @todo_list.tasks.each { |task| @task_listbox.insert('end', task) }
  end
end

root = TkRoot.new
app = ToDoApp.new(root)
Tk.mainloop
