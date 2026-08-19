 1   #lang frosthaven-manager/bestiary
 2    
 3   begin-monster
 4       "hynox archer"
 5    
 6       [0 normal [hp 2] [move 2] [attack 2]]
 7       [1 normal [hp 3] [move 3] [attack 3]]
 8       [2 normal [hp 4] [move 4] [attack 4]]
 9       [3 normal [hp 5] [move 5] [attack 5]]
10       [4 normal [hp 6] [move 6] [attack 6]]
11       [5 normal [hp 7] [move 7] [attack 7]]
12       [6 normal [hp 8] [move 8] [attack 8]]
13       [7 normal [hp 9] [move 9] [attack 9]]
14    
15       [0 elite [HP 4]  [Move 2] [Attack 3]  [Bonuses {"shield 1"}]]
16       [1 elite [HP 5]  [Move 3] [Attack 4]  [Bonuses {"shield 1"}]]
17       [2 elite [HP 6]  [Move 4] [Attack 5]  [Bonuses {"shield 1"}]]
18       [3 elite [HP 7]  [Move 5] [Attack 6]  [Bonuses {"shield 2"}]]
19       [4 elite [HP 8]  [Move 6] [Attack 7]  [Bonuses {"shield 2"}]]
20       [5 elite [HP 9]  [Move 7] [Attack 8]  [Bonuses {"shield 2"}]]
21       [6 elite [HP 10] [Move 8] [Attack 9]  [Bonuses {"shield 3"}]]
22       [7 elite [HP 11] [Move 9] [Attack 10] [Bonuses {"shield 3"}]]
23   end-monster
24    
25   begin-ability-deck
26       "archer"
27    
28       ["double-shot" 25 {"attack +2, range 5" "attack +2, range 3, +1 if same target"}]
29       ["double-shot" 25 {"attack +2, range 5" "attack +2, range 3, +1 if same target"}]
30       ["double-shot" 25 {"attack +2, range 5" "attack +2, range 3, +1 if same target"}]
31       ["double-shot" 25 {"attack +2, range 5" "attack +2, range 3, +1 if same target"}]
32       ["double-shot" 25 {"attack +2, range 5" "attack +2, range 3, +1 if same target"}]
33       ["double-shot" 25 {"attack +2, range 5" "attack +2, range 3, +1 if same target"}]
34       ["double-shot" 25 {"attack +2, range 5" "attack +2, range 3, +1 if same target"}]
35       ["take aim" 80 shuffle {"move +2" "strengthen self"}]
36   end-ability-deck
37    
38   begin-monster
39       "wyrmling archer" ("archer")
40    
41       [0 normal [hp 1] [move 1] [attack 1]]
42       [1 normal [hp 2] [move 2] [attack 2]]
43       [2 normal [hp 3] [move 3] [attack 3]]
44       [3 normal [hp 4] [move 4] [attack 4]]
45       [4 normal [hp 5] [move 5] [attack 5]]
46       [5 normal [hp 6] [move 6] [attack 6]]
47       [6 normal [hp 7] [move 7] [attack 7]]
48       [7 normal [hp 8] [move 8] [attack 8]]
49    
50       [0 elite [hp 3] [move 1] [attack 2] [Bonuses {"shield 1"}]]
51       [1 elite [hp 4] [move 2] [attack 3] [Bonuses {"shield 1"}]]
52       [2 elite [hp 5] [move 3] [attack 4] [Bonuses {"shield 1"}]]
53       [3 elite [hp 6] [move 4] [attack 5] [Bonuses {"shield 2"}]]
54       [4 elite [hp 7] [move 5] [attack 6] [Bonuses {"shield 2"}]]
55       [5 elite [hp 8] [move 6] [attack 7] [Bonuses {"shield 2"}]]
56       [6 elite [hp 9] [move 7] [attack 8] [Bonuses {"shield 3"}]]
57       [7 elite [hp 10] [move 8] [attack 9] [Bonuses {"shield 3"}]]
58   end-monster
59    
60   begin-monster
61       "hynox guard"
62    
63       [0 normal [hp 2] [move 2] [attack 2]]
64       [1 normal [hp 3] [move 3] [attack 3]]
65       [2 normal [hp 4] [move 4] [attack 4]]
66       [3 normal [hp 5] [move 5] [attack 5]]
67       [4 normal [hp 6] [move 6] [attack 6]]
68       [5 normal [hp 7] [move 7] [attack 7]]
69       [6 normal [hp 8] [move 8] [attack 8]]
70       [7 normal [hp 9] [move 9] [attack 9]]
71    
72       [0 elite [hp 4] [move 2] [attack 3] [Bonuses {"shield 1"}]]
73       [1 elite [hp 5] [move 3] [attack 4] [Bonuses {"shield 1"}]]
74       [2 elite [hp 6] [move 4] [attack 5] [Bonuses {"shield 1"}]]
75       [3 elite [hp 7] [move 5] [attack 6] [Bonuses {"shield 2"}]]
76       [4 elite [hp 8] [move 6] [attack 7] [Bonuses {"shield 2"}]]
77       [5 elite [hp 9] [move 7] [attack 8] [Bonuses {"shield 2"}]]
78       [6 elite [hp 10] [move 8] [attack 9] [Bonuses {"shield 3"}]]
79       [7 elite [hp 11] [move 9] [attack 10] [Bonuses {"shield 3"}]]
80   end-monster
81    
82   begin-ability-deck
83       "guard"
84    
85       ["rushing charge" 25 {"move +3" "attack +2 + number of spaces moved towards target"}]
86       ["rushing charge" 25 {"move +3" "attack +2 + number of spaces moved towards target"}]
87       ["rushing charge" 25 {"move +3" "attack +2 + number of spaces moved towards target"}]
88       ["rushing charge" 25 {"move +3" "attack +2 + number of spaces moved towards target"}]
89       ["rushing charge" 25 {"move +3" "attack +2 + number of spaces moved towards target"}]
90       ["rushing charge" 25 {"move +3" "attack +2 + number of spaces moved towards target"}]
91       ["rushing charge" 25 {"move +3" "attack +2 + number of spaces moved towards target"}]
92       ["stand tall" 80 shuffle {"shield 3"}]
93   end-ability-deck
94    
