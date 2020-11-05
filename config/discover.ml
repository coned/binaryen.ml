module C = Configurator.V1

let () =
  C.main ~name:"binaryen" (fun c ->
      let default : C.Pkg_config.package_conf = { libs = []; cflags = [] } in
      let conf =
        match C.ocaml_config_var c "system" with
        | None -> default
        | Some ("linux" | "macosx") ->
            {
              cflags = [ "-O2"; "-Wall"; "-Wextra" ];
              libs = [ "-lstdc++"; "-lpthread" ];
            }
        | Some unknown ->
            print_endline ("We don't know how to build for platform" ^ unknown);
            default
      in

      C.Flags.write_sexp "c_flags.sexp" conf.cflags;
      C.Flags.write_sexp "c_library_flags.sexp" conf.libs)