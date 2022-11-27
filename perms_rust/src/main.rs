use std::collections::HashSet;

const PERM_LENGTH: usize = 28;

fn main() {
    let perm1 = [
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0, 12, 13, 14, 15, 11, 16, 17, 18, 19, 20, 21, 22, 23, 24,
        25, 26, 27,
    ];
    let perm2 = [
        16, 20, 2, 3, 4, 5, 6, 7, 8, 9, 11, 1, 12, 13, 14, 15, 17, 18, 19, 0, 21, 22, 23, 24, 25,
        26, 27, 10,
    ];
    let mut perms = HashSet::new();
    perms.insert(power(perm1, 5));
    perms.insert(power(perm2, 5));
    match check_span(&perms) {
        SpanResult::Span(_) => println!("No 3 cycle found"),
        SpanResult::ThreeCycle(ccl) => println!("3 cycle Found: {ccl:?} "),
    }
}

fn multiply_permutations(a: &[u8; PERM_LENGTH], b: &[u8; PERM_LENGTH]) -> [u8; PERM_LENGTH] {
    let mut res: [u8; PERM_LENGTH] = [0; PERM_LENGTH];
    for i in 0..PERM_LENGTH {
        res[i] = b[a[i] as usize]
    }
    res
}

fn is_3_cycle(a: &[u8; PERM_LENGTH]) -> bool {
    let mut checked: [bool; PERM_LENGTH] = [false; PERM_LENGTH];
    let mut found_3_cycle = false;
    for i in 0..PERM_LENGTH {
        let mut j = i;
        let mut length = 0;
        while !checked[j] {
            length += 1;
            checked[j] = true;
            j = a[j] as usize;
        }
        if length == 3 {
            found_3_cycle = true;
        } else if length > 1 {
            return false;
        }
    }
    found_3_cycle
}

enum SpanResult {
    ThreeCycle([u8; PERM_LENGTH]),
    Span(HashSet<[u8; PERM_LENGTH]>),
}

fn check_span(perms: &HashSet<[u8; PERM_LENGTH]>) -> SpanResult {
    let mut span = perms.clone();
    let mut prev_size: usize = 0;
    let mut size = span.len();
    while prev_size != size {
        let mut new_span = span.clone();
        for perm1 in span {
            for perm2 in perms {
                let entry = multiply_permutations(&perm1, perm2);
                if is_3_cycle(&entry) {
                    return SpanResult::ThreeCycle(entry);
                }
                new_span.insert(entry);
            }
        }
        span = new_span;
        prev_size = size;
        size = span.len();
    }
    SpanResult::Span(span)
}

fn power(a: [u8; PERM_LENGTH], n: u8) -> [u8; PERM_LENGTH] {
    match n {
        1 => a,
        _ => power(multiply_permutations(&a, &a), n - 1),
    }
}
