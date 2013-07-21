ThinkingSphinx::Index.define :tool, :with => :active_record do
  indexes title, :sortable => true
  indexes desc
  # indexes author(:name), :as => :author, :sortable => true

  has tool_id, created_at, updated_at
end