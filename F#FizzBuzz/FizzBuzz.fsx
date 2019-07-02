let fizzBuzz x =
    match x with
    | _ when (x % 15) = 0 -> "FizzBuzz"
    | _ when (x % 3) = 0 -> "Fizz"
    | _ when (x % 5) = 0 -> "Buzz"
    | _ -> ""

let fizzBuzzTo max =
    [1..max] 
        |> List.iter (fun number -> printfn "%d %s" number (fizzBuzz number)) 
        |> ignore

fizzBuzzTo 100