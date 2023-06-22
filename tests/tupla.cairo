#[cfg(test)]
mod tests {
    #[test]
  fn tupla() {
    let tup = (50, 5, true);

    let (x, y, z) = tup;
    assert(y == 5, 'El resultado no es 5');
    }

}
