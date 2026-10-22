use context dcic2024

#a structure data, we always start with data. and for the name we can do whatever, but close to the data we want to create.

data My-Post:
    post(username :: String,caption :: String, likes :: Number, shares :: Number)
end

post-1 = post("@climate_now","Artice sea ice hits a record low",1250,340)
post-2 = post("@cityfarm","Our rooftop garden this week",85,4)
post-3 = post("@nu_london","Welcome to week 6!",410,12)

feed :: List<My-Post> = [list:post-1,post-2,post-3]

post-1.likes
post-2.username
feed.length()

#functions over a Post
fun engagemnet(p :: My-Post) 
  -> Number:
  doc:"likes plus ahres for a post"
  p.likes + p.shares
where:
  engagemnet(post-1) is 1590
  engagemnet(post("@hello","hello this is James Bond",0,0)) is 0
end

fun is-viral(p :: My-Post)
  -> Boolean:
  doc:"true when a post has more than 1000 likes"
  p.likes > 1000
where:
  is-viral(post-1) is true
  is-viral(post-2) is false
  is-viral(post("@JamesBond","Hello,My name is Jmaes Bod",1000, 50)) is false
end


#conditional data

#priority: variants with no fields

data Priority:
  |low
  |medium
  |high
end

task-1-priority = low
task-2-priority = medium
task-3-priority = high

check:
  is-Priority(task-1-priority) is true
  is-low(task-1-priority) is true
  is-medium(task-3-priority) is false
  is-high(task-3-priority) is true
end

#task: variants with fields
data Task:
  |task(description :: String,priority :: Priority)
  |note(description :: String)
end

task-1 = task("Buy groceries",high)
task-2 = task("Pay council tax",high)
note-1 = note("PDI exam is on October 30th")

task-1.priority
note-1.description
is-task(task-1)#true
is-note(task-1)#false

#describe
fun describe(t :: Task)
  ->String:
  cases (Task) t:
    |task(d,p) => "TASK: " + d
    |note(d) => "NOTE: " + d
  end
end

describe(task-1)
describe(note-1)

#the task(d,p) pattern mst have one name per field, in order. The note branch has one name because one field.

fun is-urgent(t :: Task)
  -> Boolean:
  doc:"true for a task with high priority; notes are never urgent"
  cases(Task) t:
    |task(d,p) => is-high(p)
    |else => false
  end
where:
  is-urgent(task-2) is true
  is-urgent(task-1) is true
  is-urgent(note-1) is false
end

#a variant with no branch
fun describe-again(t :: Task)
  -> String:
  cases(Task) t:
    |task(d,p) => "TASK: " + d
  end
end
describe-again(task-1)
#describe-again(note-1)