Type test app
=====

An application to find the types and specs in an erlang/elixir module

Build
-----

    $ rebar3 compile



```Erlang
1> get_types(fib).
#{records =>
      #{{record,state} =>
            {{"/Users/zkessin/Scratch/beam_types/src/fib.erl",6},
             [{2,
               [{count,{type,6,integer,[]},any},
                {color,{user_type,6,color,[]},any}]}]},
        {type,color,0} =>
            {{fib,{"/Users/zkessin/Scratch/beam_types/src/fib.erl",5},
                  {type,5,union,[{atom,5,red},{atom,5,green},{atom,5,blue}]},
                  []},
             any},
        {type,state,0} =>
            {{fib,{"/Users/zkessin/Scratch/beam_types/src/fib.erl",7},
                  {type,7,record,[{atom,7,state}]},
                  []},
             any}},
  specs =>
      #{{fib,fib,1} =>
            {{"/Users/zkessin/Scratch/beam_types/src/fib.erl",9},
             {tmp_contract,[#Fun<dialyzer_contracts.4.90571683>],
                           [{{type,9,'fun',
                                   [{type,9,product,[{type,9,pos_integer,[]}]},
                                    {type,9,pos_integer,[]}]},
                             []}]},
             []}}}

```


A recursive type might look like this:

```Erlang
    {type,gb_tree_node,2} =>
              {{gb_trees,
                   {"gb_trees.erl",163},
                   {type,163,union,
                       [{atom,163,nil},
                        {type,164,tuple,
                            [{var,164,'K'},
                             {var,164,'V'},
                             {user_type,164,gb_tree_node,
                                 [{var,164,'K'},{var,164,'V'}]},
                             {user_type,164,gb_tree_node,
                                 [{var,164,'K'},{var,164,'V'}]}]}]},
                   ['K','V']},
               any}

```
