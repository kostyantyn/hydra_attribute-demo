color    = Category.hydra_attributes.create(name: 'color',    backend_type: 'string',  default_value: 'red', white_list: true)
position = Category.hydra_attributes.create(name: 'position', backend_type: 'integer', default_value: 0,     white_list: true)
score    = Category.hydra_attributes.create(name: 'score',    backend_type: 'float',   default_value: 1.0,   white_list: true)
rating   = Category.hydra_attributes.create(name: 'rating',   backend_type: 'decimal', default_value: 0.0,   white_list: true)
info     = Category.hydra_attributes.create(name: 'info',     backend_type: 'text',                          white_list: true)
active   = Category.hydra_attributes.create(name: 'active',   backend_type: 'boolean', default_value: true,  white_list: true)
visited  = Category.hydra_attributes.create(name: 'visited',  backend_type: 'datetime',                      white_list: false)

set1 = Category.hydra_sets.create(name: 'Default')
set2 = Category.hydra_sets.create(name: 'Second')

HydraAttribute::HydraAttributeSet.create(hydra_attribute_id: color.id,    hydra_set_id: set1.id)
HydraAttribute::HydraAttributeSet.create(hydra_attribute_id: position.id, hydra_set_id: set1.id)
HydraAttribute::HydraAttributeSet.create(hydra_attribute_id: active.id,   hydra_set_id: set1.id)

HydraAttribute::HydraAttributeSet.create(hydra_attribute_id: color.id,    hydra_set_id: set2.id)
HydraAttribute::HydraAttributeSet.create(hydra_attribute_id: position.id, hydra_set_id: set2.id)
HydraAttribute::HydraAttributeSet.create(hydra_attribute_id: score.id,    hydra_set_id: set2.id)
HydraAttribute::HydraAttributeSet.create(hydra_attribute_id: info.id,     hydra_set_id: set2.id)

5.times do |index|
  Category.create!(
    :name     => "Category#{index} without set",
    :color    => %w[red green blue yellow white].sample,
    :position => rand(10),
    :score    => rand(10) * rand,
    :rating   => rand(100) * rand,
    :info     => SecureRandom.base64(50).split(/[^a-zA-Z]/).join(' ').strip
  )
end

5.times do |index|
  Category.create!(
    :name         => "Category#{index} with set1",
    :hydra_set_id => set1.id,
    :color        => %w[red green blue yellow white].sample,
    :position     => rand(10)
  )
end

5.times do |index|
  Category.create!(
    :name         => "Category#{index} without set2",
    :hydra_set_id => set2.id,
    :color        => %w[red green blue yellow white].sample,
    :position     => rand(10),
    :score        => rand(10) * rand,
    :rating       => rand(100) * rand,
    :active       => [true, false].sample,
  )
end