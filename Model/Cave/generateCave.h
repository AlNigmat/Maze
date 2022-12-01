#pragma once

#include <random>

#include "caveData.h"

namespace al21 {
class GenerateCave : public Cave {
 private:
  void createEmptyCave(size_t rows, size_t cols);
  bool randomizer(int chance);

 public:
  bool generate(size_t rows, size_t cols, int chance);
};

}  // namespace al21
