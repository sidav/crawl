#include <assert.h>
#include <iostream>

#include "../domino.h"
#include "../domino_data.h"

using namespace domino;
using namespace std;

int main(int argc, char** argv) {
  DominoSet<CornerDomino> dominoes(domino::periodic_set, 16);
  DominoSet<CornerDomino> aperiodic_dominoes(domino::aperiodic_set, 44);
  DominoSet<EdgeDomino> cohen_dominoes(domino::cohen_set, 8);
  vector<uint8_t> output;
  cohen_dominoes.Generate(60, 20, output, 5);
  dominoes.Generate(10, 10, output, 5);
  return 0;
}
