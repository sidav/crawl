#include <assert.h>
#include <iostream>
#include <random>

#include "../domino.h"
#include "../domino_data.h"

using namespace domino;
using namespace std;

int main(int argc, char** argv)
{
    DominoSet<CornerDomino> dominoes(domino::periodic_set, 16);
    DominoSet<CornerDomino> aperiodic_dominoes(domino::aperiodic_set, 44);
    DominoSet<EdgeDomino> cohen_dominoes(domino::cohen_set, 8);
    DominoSet<OrientedDomino> oriented_dominoes(domino::oriented_set, 4);
    vector<uint32_t> output;
    std::random_device rd;
    std::mt19937 rng(rd());
    cohen_dominoes.Generate(60, 20, output, rng);
    dominoes.Generate(10, 10, output, rng);
    oriented_dominoes.Generate(10, 10, output, rng);
    return 0;
}
