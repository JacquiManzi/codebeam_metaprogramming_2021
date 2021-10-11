defmodule Codebeam2021.Utils do
  def disassemble(beam_file) do
    beam_file = String.to_char_list(beam_file)

    {:ok, {_, [{:abstract_code, {_, ac}}]}} =
      :beam_lib.chunks(
        beam_file,
        [:abstract_code]
      )

    :io.fwrite('~s~n', [:erl_prettypr.format(:erl_syntax.form_list(ac))])
  end
end
