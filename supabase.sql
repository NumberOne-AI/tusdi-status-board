-- Run this once in Supabase > SQL Editor.

create table public.status (
  id         int primary key default 1,
  title      text not null check (char_length(title) between 1 and 60),
  subtitle   text not null default '' check (char_length(subtitle) <= 200),
  color      text not null default '#2e7d32' check (color ~ '^#[0-9a-fA-F]{6}$'),
  updated_at timestamptz not null default now(),
  constraint single_row check (id = 1)
);

insert into public.status (id, title, subtitle, color)
values (1, 'All Clear', 'Ship it.', '#2e7d32');

alter table public.status enable row level security;

-- Anyone (anon key) can read and update. No insert/delete policy => those are blocked.
create policy "public read"   on public.status for select using (true);
create policy "public update" on public.status for update using (true) with check (id = 1);

-- Live updates in open tabs
alter publication supabase_realtime add table public.status;
