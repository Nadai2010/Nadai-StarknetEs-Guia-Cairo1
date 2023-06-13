#[cfg(test)]
mod tests {
    #[test]
  fn tupla() {
    let tup = (500, 5, true);

    let (x, y, z) = tup;
    assert(y == 5, 'El resultado no es 5');
    }

}
