-- Custom SQL migration file, put you code below! --
CREATE POLICY "Read urls on form-files" ON storage.objects FOR SELECT TO public USING (bucket_id = 'form-files');