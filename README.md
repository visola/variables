## Variables

A simple Go (golang) library to find variables inside a string. Variables can also contain a tag to indicate some metadata
about the variable, like if a variable is required or not.

The format of a variable is `{name:tag}`. For now, it only supports `{` and `}` as delimiters and word `\w` characters for names and tags.

### Usage

#### Find variables

`variables.FindVariables` can be used to find variables in a string. Checkout the [test cases](variables/find_variables_test.go).

Example:

```go
stringWithVariable := "The man called {name:required} was found living in a box."
vars := FindVariables(stringWithVariable)

assert.Equal(t, 1, len(vars), "Should find one variable")
variable := vars[0]
assert.Equal(t, "name", vars[0].Name, "Should find correct name")
assert.Equal(t, "required", vars[0].Tag, "Should find correct tag")
assert.Equal(t, 15, variable.Start, "Should find start position")
assert.Equal(t, 30, variable.End, "Should find end position")
assert.Equal(t, 16, variable.NameStart, "Should find name start position")
assert.Equal(t, 20, variable.NameEnd, "Should find name end position")
assert.Equal(t, 21, variable.TagStart, "Should find tag start position")
assert.Equal(t, 29, variable.TagEnd, "Should find tag end position")

```

#### Replace Variables

`variables.ReplaceVariables` can be used as a very simple templating engine where you have a string and want some variables replaced.
Checkout the [test cases](variables/replace_variables_test.go).

Example:

```go
context := map[string]string{
	"dob":       "01/08/1956",
	"hairColor": "black",
	"location":  "Japan",
	"name":      "John",
}
	
template := `
{name} was born in {dob} in {location}.
{name} hair is {hairColor}.
{this} is a variable that is not in the context.
Two variables togethers should also work: {dob}{location}.
`

fmt.Println(ReplaceVariables(template, context))

/* output:
John was born in 01/08/1956 in Japan.
John hair is black.
{this} is a variable that is not in the context.
Two variables togethers should also work: 01/08/1956Japan.
*/

```
