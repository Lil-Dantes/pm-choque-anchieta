create extension if not exists pgcrypto;
create table if not exists public.candidates (
 id uuid primary key default gen_random_uuid(),
 name text not null,
 candidate_id text not null,
 rank text not null,
 availability text not null,
 session_token text unique not null,
 current_question integer not null default 0,
 answers jsonb not null default '[]'::jsonb,
 score integer not null default 0,
 created_at timestamptz not null default now(),
 finished_at timestamptz
);
create index if not exists candidates_session_idx on public.candidates(session_token);
create index if not exists candidates_created_idx on public.candidates(created_at desc);
alter table public.candidates enable row level security;
