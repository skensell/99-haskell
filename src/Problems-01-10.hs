import Control.Monad
import System.Exit (exitFailure)
import Test.QuickCheck
import Test.QuickCheck.Test

main :: IO ()
main = do
  result <- quickCheckResult $ conjoin tests
  unless (isSuccess result) exitFailure

tests = join
  [ tests_01
  , tests_02
  , tests_03
  , tests_04
  , tests_05
  , tests_06
  , tests_07
  , tests_08
  -- add tests of further problems here
  ]

-- Problem 1: Find the last element of a list.
tests_01 :: [Property]
tests_01 =
  [ counterexample "problem 01 test case 01" $
      myLast [1, 2, 3, 4] == 4
  , counterexample "problem 01 test case 02" $
      myLast "xyz" == 'z'
  ]

myLast :: [a] -> a
myLast xs = case xs of
  [] -> error "empty list"
  x:[] -> x
  x:xs' -> myLast xs'

-- Problem 2: Find the last but one element of a list.
tests_02 :: [Property]
tests_02 =
  [ counterexample "problem 02 test case 01" $
      myButLast [1, 2, 3, 4] == 3
  , counterexample "problem 02 test case 02" $
      myButLast "xyz" == 'y'
  ]

myButLast :: [a] -> a
myButLast xs = case xs of
  [] -> error "empty list"
  x:[] -> error "one element list"
  x:y:[] -> x
  x:xs' -> myButLast xs'

-- Problem 3: Find the kth element of a list
tests_03 :: [Property]
tests_03 =
  [ counterexample "problem 03 test case 01" $
      findKthElement [1, 2, 3, 4] 2 == 2
  , counterexample "problem 03 test case 02" $
      findKthElement [1, 2, 3, 4] 1 == 1
  ]
findKthElement :: [a] -> Int -> a
findKthElement theList k = head $ drop (k-1) theList


-- Problem 4: Find the number of elements of a list
tests_04 :: [Property]
tests_04 =
  [ counterexample "problem 04 test case 01" $
      lengthOfList [1, 2, 4, 4] == 4
  , counterexample "problem 04 test case 02" $
      lengthOfList [] == 0
  , counterexample "problem 04 test case 03" $
      lengthOfList [2] == 1
  ]
lengthOfList :: [a] -> Int
lengthOfList [] = 0
lengthOfList (x:xs) = 1 + lengthOfList xs
-- lengthOfList = length

tests_05 :: [Property]
tests_05 =
  [ counterexample "problem 05 test case 01" $
      reverseMe [1, 2, 5, 5] == [5, 5, 2, 1]
  , counterexample "problem 05 test case 02" $
      reverseMe [] == ([] :: [Int])
  , counterexample "problem 05 test case 03" $
      reverseMe [2, 1, 2] == [2, 1, 2]
  ]
reverseMe :: [a] -> [a]
reverseMe [] = []
reverseMe (x:xs) = (reverseMe xs) ++ [x]

tests_06 :: [Property]
tests_06 =
  [ counterexample "problem 06 test case 01" $
      isPalindrome [1, 2, 6, 6] == False
  , counterexample "problem 06 test case 02" $
      isPalindrome ([]::[Int]) == True
  , counterexample "problem 06 test case 03" $
      isPalindrome [2, 1, 2] == True
  ]
isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome theList = theList == reverseMe theList

tests_07 :: [Property]
tests_07 =
  [ counterexample "problem 07 test case 01" $
      myFlatten (List [Elem 1,List [ Elem 2, Elem 7], Elem 7]) == [1,2,7,7]
  , counterexample "problem 07 test case 02" $
      myFlatten (List [List[Elem 1],List [ Elem 2, Elem 7], Elem 7]) == [1,2,7,7]
  ]
data NestedList a = Elem a | List [NestedList a]
myFlatten :: NestedList a -> [a]
myFlatten (Elem a) = [a]
myFlatten (List []) = []
myFlatten (List (x:[])) = myFlatten x
myFlatten (List (x:xs)) = (myFlatten x) ++ (myFlatten (List xs)) 
-- myFlatten (List xs) = map head $ map myFlatten xs 

tests_08 :: [Property]
tests_08 =
  [ counterexample "problem 08 test case 01" $
      uniq [1,1,2,2,1] == [1,2,1]
  , counterexample "problem 08 test case 02" $
      uniq [1] == [1]
  , counterexample "problem 08 test case 03" $
      uniq [1,1] == [1]
  ]
uniq :: Eq a => [a] -> [a]
uniq [] = []
uniq (x:[]) = [x]
uniq (x:y:[]) = if x == y then [y] else [x, y]
uniq (x:y:xs) = if x == y then uniq (y:xs) else [x] ++ (uniq (y:xs))

-- tests_09 :: [Property]
-- tests_09 =
--   [ counterexample "problem 09 test case 01" $
--   , counterexample "problem 09 test case 02" $
--   , counterexample "problem 09 test case 03" $
--   ]
