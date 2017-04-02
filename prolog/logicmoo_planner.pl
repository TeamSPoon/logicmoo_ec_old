
:- if( \+ prolog_pack:current_pack(logicmoo_planner)).
:- dynamic   user:file_search_path/2.
:- multifile user:file_search_path/2.
:- prolog_load_context(directory,Dir),
   %Dir = (DirThis/planner),
   %DirFor = planner,
   %(( \+ user:file_search_path(DirFor,Dir)) ->asserta(user:file_search_path(DirFor,Dir));true),
   absolute_file_name('../../../',Y,[relative_to(Dir),file_type(directory)]),
   (( \+ user:file_search_path(pack,Y)) ->asserta(user:file_search_path(pack,Y));true).
:- attach_packs.
:- initialization(attach_packs).
:- endif.

% [Required] Load the Logicmoo Library Utils

:- system:ensure_loaded(library(logicmoo_util_structs)).
:- system:ensure_loaded(library(logicmoo_util_bb_env)).
:- show_call_entry(with_no_mpred_expansions(user:ensure_loaded(library(logicmoo/planner/logicmoo_hyhtn)))).



