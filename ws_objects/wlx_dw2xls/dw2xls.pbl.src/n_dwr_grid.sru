﻿$PBExportHeader$n_dwr_grid.sru
forward
global type n_dwr_grid from nonvisualobject
end type
end forward

global type n_dwr_grid from nonvisualobject
end type
global n_dwr_grid n_dwr_grid

type variables
PUBLIC LONG il_splitter[]
PUBLIC LONG il_splitter_ind_ord[]
PUBLIC INTEGER ii_round_init_ratio = 20
PUBLIC INTEGER ii_round_ratio = 20
PUBLIC LONG il_split_count
end variables

forward prototypes
public function long of_add_split (long al_val)
public function integer of_get_splits_between (long al_split_ind_from, long al_split_ind_to)
public function long of_find_split (long al_val)
public function long of_find_min_split ()
public function long of_find_max_split ()
public function integer of_get_split_count ()
public function integer of_get_pos (long al_start_ind, long al_stop_ind, ref long al_pos, ref integer ai_merge_cnt)
public function long of_get_col_width (long al_col)
end prototypes

public function long of_add_split (long al_val);long ll_ret = 1
long ll_i
long emp[]
long pos
boolean lb_set
ll_ret = of_find_split(al_val)
if ll_ret < 1 then
    il_split_count ++
    il_splitter[il_split_count] = al_val
    ll_ret = il_split_count
    pos = 1
    for ll_i = 1 to il_split_count - 1
        if il_splitter[il_splitter_ind_ord[ll_i]] > il_splitter[ll_ret] and not lb_set then
            emp[pos] = ll_ret
            pos ++
            lb_set = true
        end if
        emp[pos] = il_splitter_ind_ord[ll_i]
        pos ++
    next
    if not lb_set then
        emp[il_split_count] = ll_ret
    end if
    il_splitter_ind_ord = emp
end if
return ll_ret
end function

public function integer of_get_splits_between (long al_split_ind_from, long al_split_ind_to);long ll_i
long ll_start
long ll_stop
for ll_i = 1 to il_split_count
    if il_splitter_ind_ord[ll_i] = al_split_ind_from then
        ll_start = ll_i
    end if
    if il_splitter_ind_ord[ll_i] = al_split_ind_to then
        ll_stop = ll_i
    end if
next
if ll_start > 0 and ll_stop > 0 then
    if ll_start > ll_stop then
        return -1
    else
        return ll_stop - ll_start
    end if
else
    return -1
end if
end function

public function long of_find_split (long al_val);long ll_ret = -1
long ll_i
if il_split_count > 0 then
    for ll_i = 1 to il_split_count
        if abs(il_splitter[ll_i] - al_val) < ii_round_ratio then
            return ll_i
        end if
    next
end if
return ll_ret
end function

public function long of_find_min_split ();long ll_ret = -1
long ll_i
long ll_min_val
setnull(ll_min_val)
for ll_i = 1 to il_split_count
    if il_splitter[ll_i] < ll_min_val or isnull(ll_min_val) then
        ll_ret = ll_i
        ll_min_val = il_splitter[ll_i]
    end if
next
return ll_ret
end function

public function long of_find_max_split ();long ll_ret = -1
long ll_i
long ll_max_val
setnull(ll_max_val)
for ll_i = 1 to il_split_count
    if il_splitter[ll_i] > ll_max_val or isnull(ll_max_val) then
        ll_ret = ll_i
        ll_max_val = il_splitter[ll_i]
    end if
next
return ll_ret
end function

public function integer of_get_split_count ();return il_split_count
end function

public function integer of_get_pos (long al_start_ind, long al_stop_ind, ref long al_pos, ref integer ai_merge_cnt);long ll_i
long ll_start
long ll_stop
for ll_i = 1 to il_split_count
    if il_splitter_ind_ord[ll_i] = al_start_ind then
        ll_start = ll_i
    end if
    if il_splitter_ind_ord[ll_i] = al_stop_ind then
        ll_stop = ll_i
    end if
next
if ll_start > 0 and ll_stop > 0 then
    if ll_start > ll_stop then
        return -1
    else
        al_pos = ll_start
        ai_merge_cnt = ll_stop - ll_start - 1
        return 1
    end if
else
    return -1
end if
end function

public function long of_get_col_width (long al_col);if al_col > 0 and al_col < il_split_count then
    return il_splitter[il_splitter_ind_ord[al_col + 1]] - il_splitter[il_splitter_ind_ord[al_col]]
else
    return -1
end if
end function

on n_dwr_grid.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_dwr_grid.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

