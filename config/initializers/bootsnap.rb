require 'bootsnap/setup'

Bootsnap.setup(
  cache_dir: Rails.root.join('tmp/cache'),
  development_mode: Rails.env.development?,
  load_path_cache: true,
  compile_cache_iseq: true,
  compile_cache_yaml: true
)
