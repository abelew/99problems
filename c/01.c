#include <stdio.h>
#include <glib.h>

int main(int argc, char** argv) {
  GList* list;
  int count = 0;
  for (count = 0; count < argc; count++) {
    list = g_list_append(list, argv[count]);
  }
  printf("The last item is '%s'\n", g_list_last(list)->data);
  g_list_free(list);
  return 0;
}

