#include <iostream>
#include "version_manager.h"

void print_project_version_by_define() {
  std::cout<<PROJECT_VERSION_DEFINE<<std::endl;
}

int main(){
  std::cout<<project_version()<<std::endl;
  std::cout<<getLatestCommitHash()<<std::endl;
  return 0;
}
