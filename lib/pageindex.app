module lib/pageindex

  define span pageIndexLink(i : Int, lab : String) { 
    "no definition of pageIndexLink" 
  }
  
  define span pageIndex(index : Int, count : Int, perpage : Int) {
    var pages : Int := 1 + count/perpage
    if(pages > 1) { 
      if(index > 1) { 
        pageIndexLink(index-1, "Previous") 
      } else { 
        container[class="indexprevious"]{ "Previous" }
      }
      for(i : Int from 1 to pages+1) {  
        if(i == index) {
          container[class="current"]{ output(i) }
        } else { 
          container[class="indexpage"]{ pageIndexLink(i, i + "") }
        }
      }
      if(index < pages) { 
        pageIndexLink(index+1,"Next") 
      } else { 
        container[class="indexnext"]{ "Next" }
      }
    } 
  }

  define span pageIndexUpto(index : Int, more : Bool) {
    var pages : Int := index
    if(index > 1) { 
      pageIndexLink(index-1, "Previous") 
    } else { 
      container[class="indexprevious"]{ "Previous" }
    }
    for(i : Int from 1 to pages+1) {  
      if(i == index) {
        container[class="current"]{ output(i) }
      } else { 
        container[class="indexpage"]{ pageIndexLink(i, i + "") }
      }
    }
    if(more) {
      pageIndexLink(index+1,"Next")
    } else {
      container[class="indexnext"]{ "Next" }
    }
  }