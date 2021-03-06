local r = require('rethinkdb')

describe('connection', function()
  it('basic', function()
    r.connect(function(err, c)
      if err then error(err.message) end
      assert.are_not.equal(c, nil)
    end)
  end)
  it('return conn', function()
    local conn = r.connect()
    assert.are_not.equal(conn, nil)
    assert.are.equal(conn.open, true)
    conn:close()
    assert.are.equal(conn.open, false)
  end)
  it('basic_pool', function()
    r.pool({}, function(err, p)
      if err then error(err.message) end
      assert.are_not.equal(p, nil)
    end)
  end)
end)
