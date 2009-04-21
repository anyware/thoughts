#/spec/factories/thoughts.rb
Factory.define :valid_thought, :class => Thought do |t|
  t.title "First thought"
  t.description "First thought description"
  t.user { |u| u.association(:valid_user) }
end

Factory.define :invalid_thought, :class => Thought do |t|
end