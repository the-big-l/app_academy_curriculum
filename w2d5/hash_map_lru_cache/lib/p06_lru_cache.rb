require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @store.include?(key)
      @store.get(key)
      update_link!(@map.get(key))
    else

      eject! if count >= @max
      calc!(key)
    end

    @store.last.val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    val = @prc.call(key)
    @store.append(key, val)
    @map.set(key, @store.last)
    val
  end

  def update_link!(link)
    # bypass the link we want to remove
    link.next.prev = link.prev
    link.prev.next = link.next

    # make new connections on the link itself
    link.next = @store.last.next
    link.prev = @store.last

    # make tail connect to the new link
    link.next.prev = link
    # the old last connection to the new link
    link.prev.next = link
  end

  def eject!
    @map.delete(@store.first.key)
    @store.first.next.prev = @store.first.prev
    @store.first.prev.next = @store.first.next
  end
end
