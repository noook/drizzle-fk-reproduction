-- Custom SQL migration file, put you code below! --
insert into storage.buckets
  (id, name, public)
values
  ('temp-files', 'temp-files', false)
ON CONFLICT (id) DO NOTHING;

CREATE POLICY "Upload files to anonymous users for form submit" ON storage.objects FOR INSERT TO public WITH CHECK (bucket_id = 'temp-files');