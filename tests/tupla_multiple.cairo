#[cfg(test)]
mod tests {
    #[test]
  fn tupla() {
    let tup = (500, 5, true);

    let (x, y, z) = tup;
    assert(x == 500, 'El resultado no es 500');
    assert(y == 5, 'El resultado no es 5');
    assert(z == true, 'El resultado no es Verdadero');
    }

}
