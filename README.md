# type-practicer

A tool for students to practice "parsing" C++ expressions and determining
their types.

The motivation for this comes from my philosophy that a key driver of novices'
development of programming skills is their **mental models** of the abstractions 
represented by the code they are looking at. (Quite often, the code they are looking
at is code they wrote themselves, and they don't have a correct or consistent mental
model of what it expresses or represents.)

In a strongly-typed language like C++, one
aspect of this is being able to look at any expression, typically within an overall
'command' (i.e. statement), and answer the question "**what** is that thing?"
Is it...
- an int?
- a string?
- a char?
- an array of doubles?
- a Cow? [assuming Cow has been declared as a type]
- or what??

I started noticing, when helping students one-on-one with their code, that when they
got lost in working with their own code, often they were stumbling at this basic level
of "parsing" what they themselves had written. This tool is something I built to
help them drill themselves on the specific task of type determination.

**This is currently broken!!** The front end pieces and the backend script are not communicating
with each other. It needs to be updated to use jQuery and an AJAX request in a sensible
standard way.
