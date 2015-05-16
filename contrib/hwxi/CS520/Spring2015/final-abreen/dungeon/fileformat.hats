fun setup_exits (
  sp: Space,
  ne: string,
  ee: string,
  se: string,
  we: string
): void =
  begin
    (
      case ne of
      | "~" => ()
      | exit_id => set_exit_id(sp, exit_id, North)
    );
    (
      case ee of
      | "~" => ()
      | exit_id => set_exit_id(sp, exit_id, East)
    );
    (
      case se of
      | "~" => ()
      | exit_id => set_exit_id(sp, exit_id, South)
    );
    (
      case we of
      | "~" => ()
      | exit_id => set_exit_id(sp, exit_id, West)
    )
  end

fun setup_room (file: FILEref, id: string): void =
  let
    val north_exit = strptr2string(fileref_get_line_string(file))
    val east_exit = strptr2string(fileref_get_line_string(file))
    val south_exit = strptr2string(fileref_get_line_string(file))
    val west_exit = strptr2string(fileref_get_line_string(file))

    val name = strptr2string(fileref_get_line_string(file))
    val desc = strptr2string(fileref_get_line_string(file))

    val r = create_room(id, name, desc)
  in
    setup_exits(r, north_exit, east_exit, south_exit, west_exit)
  end

fun setup_room (file: FILEref, id: string): void =
  let
    val north_exit = strptr2string(fileref_get_line_string(file))
    val east_exit = strptr2string(fileref_get_line_string(file))
    val south_exit = strptr2string(fileref_get_line_string(file))
    val west_exit = strptr2string(fileref_get_line_string(file))

    val name = strptr2string(fileref_get_line_string(file))
    val desc = strptr2string(fileref_get_line_string(file))

    val r = create_room(id, name, desc)
  in
    setup_exits(r, north_exit, east_exit, south_exit, west_exit)
  end

fun read_spaces (file: FILEref): void =
  let
    val type = strptr2string(fileref_get_line_string(file))
    val id = strptr2string(fileref_get_line_string(file))
  in
    begin
      if eq_string_string(id, "") then ()
      else
        (
          if eq_string_string(type, "room") then setup_room(file, id)
          else if eq_string_string(type, "door") then ()
          else ()
        );
      if fileref_isnot_eof(file) then
        // read another space
        read_spaces(file)
      else
        ()
    end
  end

fun open_universe (path: string): void =
  let
    val file: FILEref = fileref_open_exn(path, file_mode_r)
  in (read_spaces(file); fileref_close(file))
  end
