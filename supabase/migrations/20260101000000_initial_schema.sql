-- =============================================================================
-- OSRAM Thailand Catalog — Supabase schema (migration 1 of 2)
--
-- You're using Supabase's GitHub integration, so this file does NOT need to
-- be run manually in the SQL Editor — Supabase applies every file under
-- supabase/migrations/ automatically (in filename order) when this repo is
-- pushed to the branch you linked in Project Settings → Integrations →
-- GitHub. Edit this file and commit BEFORE pushing, not after.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1) categories — one row per product category (matches the 23 sections of
--    the catalog). "key" is the same slug used throughout the website's code
--    (e.g. 'led-bulb'), so don't rename existing keys after you've linked
--    products to them.
-- ---------------------------------------------------------------------------
create table if not exists categories (
  key            text primary key,
  name           text not null,               -- Thai display name shown on the site
  name_en        text,
  tagline        text,
  specs_common   jsonb default '{}'::jsonb,    -- e.g. {"IP":"IP20","CRI":"≥80",...}
  base           text,                         -- ขั้วหลอด/รูปแบบ (E27, GU10, ในตัว ...)
  warranty       text,                         -- การรับประกัน (e.g. "2 ปี")
  sort_order     int not null default 0,
  updated_at     timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- 2) products — one row per SKU.
-- ---------------------------------------------------------------------------
create table if not exists products (
  id             uuid primary key default gen_random_uuid(),
  category_key   text not null references categories(key) on delete cascade,
  model          text not null,                -- Model No. (e.g. "LDEA45 3W 90LM/W 830")
  code           text not null,                -- Basic Code (e.g. "AC73032")
  w              numeric,
  retrofit       numeric,
  lm             numeric,
  v              text,
  cctcode        text,                         -- 827/830/840/865/TRI/...
  dim            text,
  cutout         text,
  pack           text,
  material       text,
  mount          text,
  color          text,
  series         text,
  tube           text,
  solar          text,
  battery        text,
  note           text,
  created_at     timestamptz not null default now(),
  updated_at     timestamptz not null default now(),
  unique (category_key, code)                  -- lets Excel re-import UPSERT cleanly
);

create index if not exists products_category_key_idx on products (category_key);
create index if not exists products_code_idx on products (code);

-- ---------------------------------------------------------------------------
-- 3) Row Level Security
--    RLS is ON by default for new Supabase projects' public schema tables
--    once you enable it below. The anon key is meant to be public (it's
--    embedded in the website's JS), so access control lives in these
--    policies, not in keeping the key secret.
-- ---------------------------------------------------------------------------
alter table categories enable row level security;
alter table products   enable row level security;

-- Anyone (the public website) can read — needed for the catalog to display.
create policy "public can read categories" on categories
  for select using (true);
create policy "public can read products" on products
  for select using (true);

-- ---- Writes (needed for the "Import Excel" feature in the website) -------
-- Pick ONE of the two options below.
--
-- OPTION A — quick start, anon key can write (fine for an internal/staff
-- tool that isn't linked from anywhere public, but anyone who finds your
-- anon key could also write). Uncomment to use:
--
-- create policy "anon can upsert products" on products
--   for insert with check (true);
-- create policy "anon can update products" on products
--   for update using (true) with check (true);
-- create policy "anon can upsert categories" on categories
--   for update using (true) with check (true);
--
-- OPTION B (recommended for anything internet-facing) — only signed-in
-- users can write. Turn on Supabase Auth, sign in staff with email/password
-- or magic link, and use policies like:
--
-- create policy "authenticated can upsert products" on products
--   for insert to authenticated with check (true);
-- create policy "authenticated can update products" on products
--   for update to authenticated using (true) with check (true);
-- create policy "authenticated can update categories" on categories
--   for update to authenticated using (true) with check (true);
--
-- Until you enable one of these, imports from the website will fail to
-- save to Supabase (they'll still update the visitor's own browser only,
-- same as before).

-- ---------------------------------------------------------------------------
-- 4) Keep updated_at fresh automatically
-- ---------------------------------------------------------------------------
create or replace function set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

drop trigger if exists trg_products_updated_at on products;
create trigger trg_products_updated_at
  before update on products
  for each row execute function set_updated_at();

drop trigger if exists trg_categories_updated_at on categories;
create trigger trg_categories_updated_at
  before update on categories
  for each row execute function set_updated_at();
