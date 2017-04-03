{application, 'rest', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['new','rest_app','rest_sup']},
	{registered, [rest_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {rest_app, []}},
	{env, []}
]}.