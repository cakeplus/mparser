
(* MParser, a simple monadic parser combinator library
   -----------------------------------------------------------------------------
   Copyright (C) 2008, Holger Arnold
                 2014-2020, Max Mouratov

   License:
     This library is free software; you can redistribute it and/or
     modify it under the terms of the GNU Library General Public
     License version 2.1, as published by the Free Software Foundation.

     This library is distributed in the hope that it will be useful,
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

     See the GNU Library General Public License version 2.1 for more details
     (enclosed in the file LICENSE.txt).
*)

(** RE-based regular expression parsers.
    The used syntax is re.perl (the one most similar to PCRE).
*)


module Regexp: MParser_Sig.Regexp

include module type of MParser.MakeRegexp (Regexp)


val wrap: Re.re -> Regexp.t
(** Wrap a compiled regular expression into an abstract regexp.

    Use this to circumvent limitations of [Regexp.make], which is defined as:

      let make (rx: string) : Regexp.t =
        Re.Perl.(compile (re ~opts:[ `Anchored ] rx))
*)
