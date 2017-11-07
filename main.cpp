#include <iostream>
#include <vector>
using namespace std;

#define EMIT(expr) { cout << typeid(expr).name(); }

struct Thing
{
  int number;
  string word;
  vector<int> whee;
};

int main()
{
  Thing blah[400];
  vector<Thing> list;
  Thing item;
  EMIT(list[5].whee[4])
}
