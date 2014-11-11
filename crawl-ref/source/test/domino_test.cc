#include <assert.h>
#include <iostream>

#include "../asg.h"
#include "../domino.h"
#include "../domino_data.h"

using namespace domino;
using namespace std;

int main(int argc, char** argv)
{
    DominoSet<CornerDomino> dominoes(domino::periodic_set, 16);
    DominoSet<CornerDomino> aperiodic_dominoes(domino::aperiodic_set, 44);
    DominoSet<EdgeDomino> cohen_dominoes(domino::cohen_set, 8);
    vector<uint32_t> output;
    AsgKISS rng;
    cohen_dominoes.Generate(60, 20, output, rng);
    dominoes.Generate(10, 10, output, rng);
    return 0;
}
