-- Custom SQL migration file, put you code below! --
insert into storage.buckets
  (id, name, public)
values
  ('form-files', 'form-files', false)
ON CONFLICT (id) DO NOTHING;
